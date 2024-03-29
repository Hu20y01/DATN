package com.example.appbanhang.model;

import java.io.Serializable;

public class LoaiSp implements Serializable {
    int id;
    String tensanpham;
    String hinhanh;

    public LoaiSp() {
    }

    public LoaiSp(int id, String tensanpham, String hinhanh) {
        this.id = id;
        this.tensanpham = tensanpham;
        this.hinhanh = hinhanh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTensanpham() {
        return tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        this.tensanpham = tensanpham;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }
}
