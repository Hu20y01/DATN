<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".activity.GioHangActivity">

    <TextView
        android:id="@+id/txtgiohangtrong"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Giỏ hàng trống"
        android:textSize="20sp"
        android:textStyle="bold"
        android:visibility="gone"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <androidx.appcompat.widget.Toolbar
        android:id="@+id/toolbar"
        android:layout_width="match_parent"
        android:layout_height="?attr/actionBarSize"
        android:background="#36dd07"
        app:layout_constraintTop_toTopOf="parent"
        app:title="Giỏ Hàng" />

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recycleviewgiohang"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="2"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintTop_toBottomOf="@id/toolbar"/>

    <LinearLayout
        android:id="@+id/layout1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        android:weightSum="2"
        app:layout_constraintBottom_toTopOf="@+id/btnmuahang">

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginLeft="10dp"
            android:layout_weight="1"
            android:padding="5dp"
            android:text="@string/t_ng_ti_n"
            android:textColor="@android:color/holo_red_light"
            android:textSize="18sp"
            android:textStyle="bold" />

        <TextView
            android:id="@+id/txttongtien"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="right"
            android:layout_marginRight="20dp"
            android:layout_weight="1"
            android:padding="5dp"
            android:text="50.000"
            android:textColor="@android:color/holo_red_light"
            android:textSize="18sp"
            android:textStyle="bold" />
    </LinearLayout>

    <Button
        android:id="@+id/btnmuahang"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_weight="0.2"
        android:text="@string/mua_h_ng"
        app:layout_constraintBottom_toTopOf="@+id/btntieptucmuahang" />

    <Button
        android:id="@+id/btntieptucmuahang"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_weight="0.2"
        android:text="Tiếp tục mua hàng"
        app:layout_constraintBottom_toBottomOf="parent"
        tools:layout_editor_absoluteX="20dp" />

</androidx.constraintlayout.widget.ConstraintLayout>