package com.example.demo.repository;

import com.example.demo.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface NhanVienRepository extends JpaRepository<NhanVien, UUID> {

    @Query("SELECT nv from NhanVien nv INNER JOIN nv.idChucVu cv WHERE (nv.ten is null or nv.ten like %:tenSearch%) and (nv.ma is null or nv.ma like %:maSearch%)")
    Page<NhanVien> getAll(Pageable pageable , @Param("tenSearch") String ten, @Param("maSearch") String ma);

//    @Query("SELECT nv FROM NhanVien nv WHERE (nv.ma is null or nv.ma like %:maSearch%) and(nv.ten is null or nv.ten like %:tenSearch%)")
//    List<NhanVien> search(@Param("maSearch") String ma, @Param("tenSearch") String ten);

}
