package com.example.appbanhang.activity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appbanhang.R;
import com.example.appbanhang.adapter.DanhMucAdapter;
import com.example.appbanhang.adapter.LoaiSpAdapter;
import com.example.appbanhang.model.EventBus.SuaXoaDMEvent;
import com.example.appbanhang.model.EventBus.SuaXoaEvent;
import com.example.appbanhang.model.LoaiSp;
import com.example.appbanhang.model.SanPhamMoi;
import com.example.appbanhang.retrofit.ApiBanHang;
import com.example.appbanhang.retrofit.RetrofitClient;
import com.example.appbanhang.util.Utils;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class QuanLyDanhMucActivity extends AppCompatActivity {
    ImageView img_them;
    RecyclerView recyclerView;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;
    List<LoaiSp> list;
    DanhMucAdapter adapter;

    LoaiSp danhMucSuaXoa;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quan_ly_danh_muc);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        initView();
        initControl();
        getData();
    }

    private void initControl() {
        img_them.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), ThemDMActivity.class);
                startActivity(intent);
            }
        });
    }

    private void getData() {
        compositeDisposable.add(apiBanHang.getDanhMuc()
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(
                loaiSpModel -> {
                    list = loaiSpModel.getResult();
                    adapter = new DanhMucAdapter(getApplicationContext(), list);
                    recyclerView.setAdapter(adapter);
                },
                throwable -> {
                    Toast.makeText(getApplicationContext(),"Không kết nối được với server"+throwable.getMessage(),Toast.LENGTH_LONG).show();
                }
            ));
    }

    private void initView() {
        img_them = findViewById(R.id.img_them);
        recyclerView = findViewById(R.id.recycleview_ql);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(layoutManager);
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item) {
        if(item.getTitle().equals("Sửa")){
            suaData();
        }else if(item.getTitle().equals("Xóa")){
            xoaData();
        }
        return super.onContextItemSelected(item);
    }

    private void xoaData() {
        compositeDisposable.add(apiBanHang.xoaDanhMuc(danhMucSuaXoa.getId())
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(
            messageModel -> {
                if (messageModel.isSuccess()) {
                    Toast.makeText(getApplicationContext(), messageModel.getMessage(), Toast.LENGTH_LONG).show();
                    getData();
                } else {
                    Toast.makeText(getApplicationContext(), messageModel.getMessage(), Toast.LENGTH_LONG).show();
                }
            },
            throwable -> {
                Log.d("log",throwable.getMessage());
            }
        ));
    }

    private void suaData() {
        Intent intent = new Intent(getApplicationContext(), ThemDMActivity.class);
        intent.putExtra("sua", danhMucSuaXoa);
        startActivity(intent);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
    @Subscribe(sticky = true,threadMode = ThreadMode.MAIN)
    public void eventSuaXoa(SuaXoaDMEvent event){
        if(event != null){
            danhMucSuaXoa = event.getDanhMuc();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        EventBus.getDefault().register(this);
    }

    @Override
    protected void onStop() {
        super.onStop();
        EventBus.getDefault().unregister(this);
    }
}