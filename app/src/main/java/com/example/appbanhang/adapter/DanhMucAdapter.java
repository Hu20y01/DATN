package com.example.appbanhang.adapter;

import android.content.Context;
import android.content.Intent;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.example.appbanhang.Interface.ItemClickListen;
import com.example.appbanhang.R;
import com.example.appbanhang.activity.ChiTietActivity;
import com.example.appbanhang.model.EventBus.SuaXoaDMEvent;
import com.example.appbanhang.model.EventBus.SuaXoaEvent;
import com.example.appbanhang.model.LoaiSp;
import com.example.appbanhang.model.SanPhamMoi;
import com.example.appbanhang.util.Utils;

import org.greenrobot.eventbus.EventBus;

import java.text.DecimalFormat;
import java.util.List;

import io.reactivex.rxjava3.annotations.NonNull;

public class DanhMucAdapter extends RecyclerView.Adapter<DanhMucAdapter.MyViewHolder> {

    Context context;
    List<LoaiSp> array;

    public DanhMucAdapter(Context context, List<LoaiSp> array) {
        this.context = context;
        this.array = array;
    }

    @androidx.annotation.NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@androidx.annotation.NonNull ViewGroup parent, int viewType) {
        View item = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_danhmuc, parent, false);
        return new MyViewHolder(item);
    }

    @Override
    public void onBindViewHolder(@androidx.annotation.NonNull MyViewHolder holder, int position) {
        LoaiSp loaiSp = array.get(position);
        holder.txt_tendanhmuc.setText(loaiSp.getTensanpham());

        holder.setItemClickListener(new ItemClickListen() {
            @Override
            public void onClick(View view, int pos, boolean isLongClick) {
                if (isLongClick) {
                    EventBus.getDefault().postSticky(new SuaXoaDMEvent(loaiSp));
                } else {
                    EventBus.getDefault().postSticky(new SuaXoaDMEvent(loaiSp));
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return array.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, View.OnCreateContextMenuListener, View.OnLongClickListener {
        TextView txt_tendanhmuc;
        private ItemClickListen itemClickListener;
        public MyViewHolder(@NonNull View itemView){
            super(itemView);
            txt_tendanhmuc = itemView.findViewById(R.id.txt_tendanhmuc);
            itemView.setOnClickListener(this);
            itemView.setOnCreateContextMenuListener(this);
            itemView.setOnLongClickListener(this);
        }

        public void setItemClickListener(ItemClickListen itemClickListener) {
            this.itemClickListener = itemClickListener;
        }

        @Override
        public void onClick(View view) {
            itemClickListener.onClick(view,getAdapterPosition(),false);
        }

        @Override
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            contextMenu.add(0,0,getAdapterPosition(),"Sửa");
            contextMenu.add(0,0,getAdapterPosition(),"Xóa");
        }

        @Override
        public boolean onLongClick(View view) {
            itemClickListener.onClick(view,getAdapterPosition(),true);
            return false;
        }
    }
}
