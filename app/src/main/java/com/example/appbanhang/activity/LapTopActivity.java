package com.example.appbanhang.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.appbanhang.R;
import com.example.appbanhang.adapter.LapTopAdapter;
import com.example.appbanhang.adapter.LoaiSpAdapter;
import com.example.appbanhang.model.LoaiSp;
import com.example.appbanhang.model.SanPhamMoi;
import com.example.appbanhang.retrofit.ApiBanHang;
import com.example.appbanhang.retrofit.RetrofitClient;
import com.example.appbanhang.util.Utils;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class LapTopActivity extends AppCompatActivity {
    Toolbar toolbar;
    RecyclerView recyclerView;
    ApiBanHang apiBanHang;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    int page = 1;
    int loai, danhMuc;
    LapTopAdapter adapterDt;
    List<SanPhamMoi> sanPhamMoiList;
    LinearLayoutManager linearLayoutManager;
    Handler handler = new Handler();
    boolean isLoading = false;
    List<LoaiSp> mangloaisp;
    LoaiSpAdapter loaiSpAdapter;
    Spinner spDanhMuc;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lap_top);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        loai = getIntent().getIntExtra("loai",1);
        Anhxa();
        ActionToolBar();
        getDanhMuc();
        getData(page);
        addEventLoad();
    }

    private void addEventLoad() {
//        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
//            @Override
//            public void onScrollStateChanged(@NonNull RecyclerView recyclerView, int newState) {
//                super.onScrollStateChanged(recyclerView, newState);
//            }
//
//            @Override
//            public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
//                super.onScrolled(recyclerView, dx, dy);
//                if(isLoading ==false ){
//                    if(linearLayoutManager.findLastCompletelyVisibleItemPosition()== sanPhamMoiList.size()-1);{
//                        isLoading=true;
//                        loadMore();
//                    }
//                }
//            }
//        });
    }

    private void loadMore() {
        handler.post(new Runnable() {
            @Override
            public void run() {
                sanPhamMoiList.add(null);
                adapterDt.notifyItemInserted(sanPhamMoiList.size()-1);
            }
        });
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                sanPhamMoiList.remove(sanPhamMoiList.size()-1);
                adapterDt.notifyItemRemoved(sanPhamMoiList.size()-1);
                page = page +1;
                getData(page);
                adapterDt.notifyDataSetChanged();
                isLoading = false;
            }
        },2000);

    }

    private void ActionToolBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    private void getDanhMuc() {
        compositeDisposable.add(apiBanHang.getLoaiSp()
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(
                loaiSpModel -> {
                    if (loaiSpModel.isSuccess()){
                        mangloaisp = loaiSpModel.getResult();
                        loaiSpAdapter = new LoaiSpAdapter(getApplicationContext(),mangloaisp);
                        spDanhMuc.setAdapter(loaiSpAdapter);
                        spDanhMuc.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                            @Override
                            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                                if (danhMuc != mangloaisp.get(position).getId()) {
                                    sanPhamMoiList.clear();
                                    adapterDt.notifyDataSetChanged();
                                    danhMuc = mangloaisp.get(position).getId();
                                    page = 1;
                                    getData(page);
                                    addEventLoad();
                                }
                            }

                            @Override
                            public void onNothingSelected(AdapterView<?> parent) {

                            }
                        });
                    }
                }
            ));
    }

    private void getData(int page) {
        Log.d("test", page + "..." + loai);
        compositeDisposable.add(apiBanHang.getSanPham(page, danhMuc)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(
                sanPhamMoiModel -> {
                    if(sanPhamMoiModel.isSuccess()){
                        if(adapterDt == null){
                            sanPhamMoiList = sanPhamMoiModel.getResult();
                            adapterDt = new LapTopAdapter(getApplicationContext(), sanPhamMoiList);
                            recyclerView.setAdapter(adapterDt);
                        }else{
                            int vitri = sanPhamMoiList.size()-1;
                            int soluongadd = sanPhamMoiModel.getResult().size();
                            for(int i=0;i<soluongadd;i++){
                                sanPhamMoiList.add(sanPhamMoiModel.getResult().get(i));
                            }
                            adapterDt.notifyItemRangeInserted(vitri,soluongadd);
                        }

                    }else{
                        isLoading = true;
                    }
                },
                throwable -> {
                    Toast.makeText(this, "không kết nối được sever", Toast.LENGTH_SHORT).show();
                }
            )
        );
    }

    private void Anhxa() {
        toolbar = findViewById(R.id.toobar);
        spDanhMuc = findViewById(R.id.sp_danhmuc);
        recyclerView = findViewById(R.id.recycleview_lt);
        linearLayoutManager = new LinearLayoutManager(this,LinearLayoutManager.VERTICAL,false);
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setHasFixedSize(true);
        sanPhamMoiList = new ArrayList<>();
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}