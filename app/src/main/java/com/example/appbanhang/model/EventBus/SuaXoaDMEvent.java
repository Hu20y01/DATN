package com.example.appbanhang.model.EventBus;

import com.example.appbanhang.model.LoaiSp;

public class SuaXoaDMEvent {
    LoaiSp danhMuc;

    public SuaXoaDMEvent(LoaiSp danhMuc) {
        this.danhMuc = danhMuc;
    }

    public LoaiSp getDanhMuc() {
        return danhMuc;
    }

    public void setDanhMuc(LoaiSp danhMuc) {
        this.danhMuc = danhMuc;
    }
}
