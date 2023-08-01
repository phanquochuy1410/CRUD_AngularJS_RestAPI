package com.example.demo.repository;

import com.example.demo.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;
import java.util.UUID;

public interface NhanVienRepository extends JpaRepository<NhanVien , UUID> {

//    @Query(" SELECT nv , cv from NhanVien nv INNER JOIN ChucVu cv " +
//            " on cv.id = nv.idChucVu ")
//    List<NhanVien> getAll();

//    @Query("SELECT nv FROM NhanVien nv WHERE (nv.ma is null or nv.ma like %:maSearch%) and(nv.ten is null or nv.ten like %:tenSearch%)")
//    List<NhanVien> search(@Param("maSearch") String ma , @Param("tenSearch") String ten);

    @Query("SELECT nv FROM NhanVien nv WHERE nv.ma like %:maSearch%")
    List<NhanVien> search(@Param("maSearch") String ma);
}
