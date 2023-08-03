package com.example.demo.service;

import com.example.demo.entity.NhanVien;
import com.example.demo.model.repest.CreateNhanVien;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface NhanVienService {

    List<NhanVien> getAll();

    NhanVien getOne(UUID id);

    NhanVien add(@Valid CreateNhanVien nhanVien);

    NhanVien update(CreateNhanVien nhanVien , UUID id);

    void delete(NhanVien nhanVien);

    List<NhanVien> search(String ma , String ten);

    Page<NhanVien> showAll(Pageable pageable , String ten , String ma);

}
