package com.example.appbanhang.activity;

import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.viewbinding.ViewBinding;

import com.example.appbanhang.R;
import com.example.appbanhang.databinding.ActivityThemdmBinding;
import com.example.appbanhang.databinding.ActivityThemspBinding;
import com.example.appbanhang.model.LoaiSp;
import com.example.appbanhang.model.MessageModel;
import com.example.appbanhang.model.SanPhamMoi;
import com.example.appbanhang.retrofit.ApiBanHang;
import com.example.appbanhang.retrofit.RetrofitClient;
import com.example.appbanhang.util.Utils;
import com.github.dhaval2404.imagepicker.ImagePicker;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;

public class ThemDMActivity extends AppCompatActivity {
    ActivityThemdmBinding binding;
    ApiBanHang apiBanHang;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    LoaiSp danhMucSua;
    boolean flag = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ViewBinding a;
        binding= ActivityThemdmBinding.inflate(getLayoutInflater());
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        setContentView(R.layout.activity_themdm);
        setContentView(binding.getRoot());
        initData();

        Intent intent = getIntent();
        danhMucSua = (LoaiSp) intent.getSerializableExtra("sua");
        System.out.println(danhMucSua);
        if (danhMucSua == null) {
            flag = false;
        } else {
            flag = true;
            binding.btnthem.setText("Sửa sản phẩm");
            binding.tendm.setText(danhMucSua.getTensanpham());
        }
    }

    private void initData() {
        binding.btnthem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(flag == false){
                    themDanhMuc();
                }else{
                    suaDanhMuc();
                }

            }
        });
    }

    private void suaDanhMuc() {
        String str_ten = binding.tendm.getText().toString().trim();
        if (TextUtils.isEmpty(str_ten)) {
            Toast.makeText(getApplicationContext(),"vui lòng nhập đủ thông tin",Toast.LENGTH_LONG).show();
        } else{
            compositeDisposable.add(apiBanHang.capNhatDanhMuc(str_ten, danhMucSua.getId())
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                    messageModel -> {
                        if(messageModel.isSuccess()){
                            Toast.makeText(getApplicationContext(),messageModel.getMessage(),Toast.LENGTH_LONG).show();
                            Intent intent = new Intent(getApplicationContext(), QuanLyDanhMucActivity.class);
                            startActivity(intent);
                        }else{
                            Toast.makeText(getApplicationContext(),messageModel.getMessage(),Toast.LENGTH_LONG).show();
                        }
                    },
                    throwable -> {
                        Toast.makeText(getApplicationContext(),throwable.getMessage(),Toast.LENGTH_LONG).show();
                    }
                ));
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
    }

    private void themDanhMuc() {
        String str_ten = binding.tendm.getText().toString().trim();
        if(TextUtils.isEmpty(str_ten)){
            Toast.makeText(getApplicationContext(),"vui lòng nhập đủ thông tin",Toast.LENGTH_LONG).show();
        }else{
            compositeDisposable.add(apiBanHang.themDanhMuc(str_ten)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(
                messageModel -> {
                    if (messageModel.isSuccess()){
                        Toast.makeText(getApplicationContext(),messageModel.getMessage(),Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(getApplicationContext(), QuanLyDanhMucActivity.class);
                        startActivity(intent);
                    }else{
                        Toast.makeText(getApplicationContext(),messageModel.getMessage(),Toast.LENGTH_LONG).show();
                    }
                },
                throwable -> {
                    Toast.makeText(getApplicationContext(),throwable.getMessage(),Toast.LENGTH_LONG).show();
                }
            ));
        }
    }
}

