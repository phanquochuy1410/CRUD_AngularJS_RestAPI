package com.example.demo.service.impl;

import com.example.demo.entity.NhanVien;
import com.example.demo.model.repest.CreateNhanVien;
import com.example.demo.model.repest.SearchNhanVien;
import com.example.demo.repository.ChucVuRepository;
import com.example.demo.repository.NhanVienRepository;
import com.example.demo.service.NhanVienService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class NhanVienServiceImpl implements NhanVienService {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private ChucVuRepository chucVuRepository;

    @Override
    public List<NhanVien> getAll() {
        return nhanVienRepository.findAll();
    }

    @Override
    public NhanVien getOne(UUID id) {
        return nhanVienRepository.getReferenceById(id);
    }

    @Override
    public NhanVien add(@Valid CreateNhanVien nhanVien) {
        NhanVien add = NhanVien.builder()
                .ma(nhanVien.getMa())
                .ten(nhanVien.getTen())
                .sdt(nhanVien.getSdt())
                .idChucVu(chucVuRepository.findById(nhanVien.getIdChucVu()).get()).build();
        return nhanVienRepository.save(add);
    }

    @Override
    public NhanVien update(CreateNhanVien nhanVien, UUID id) {
        NhanVien update = nhanVienRepository.findById(id).get();
        update= NhanVien.builder()
                .id(id)
                .ma(nhanVien.getMa())
                .ten(nhanVien.getTen())
                .sdt(nhanVien.getSdt())
                .idChucVu(chucVuRepository.findById(nhanVien.getIdChucVu()).get())
                .build();
        return nhanVienRepository.save(update);
    }

    @Override
    public void delete(NhanVien nhanVien) {
        nhanVienRepository.delete(nhanVien);
    }

    @Override
    public List<NhanVien> search(String ma , String ten) {
        return nhanVienRepository.search(ma , ten);
    }

//    @Override
//    public List<NhanVien> search(String ma) {
//        return nhanVienRepository.search(ma);
//    }
}
