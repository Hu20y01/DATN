package com.example.appbanhang.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.appbanhang.model.LoaiSp;

import java.util.List;

public class CustomSpinnerAdapter extends ArrayAdapter<LoaiSp> {
    private Context mContext;
    private List<LoaiSp> mData;

    public CustomSpinnerAdapter(Context context, int resource, List<LoaiSp> data) {
        super(context, resource, data);
        this.mContext = context;
        this.mData = data;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = LayoutInflater.from(mContext);
        View row = inflater.inflate(android.R.layout.simple_spinner_dropdown_item, parent, false);

        TextView textView = row.findViewById(android.R.id.text1);
        LoaiSp currentItem = mData.get(position);
        textView.setText(currentItem.getTensanpham());

        return row;
    }

    @Override
    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        return getView(position, convertView, parent);
    }
}
