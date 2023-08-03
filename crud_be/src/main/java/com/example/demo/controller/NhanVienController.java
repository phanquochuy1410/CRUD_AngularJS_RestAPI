package com.example.demo.controller;

import com.example.demo.entity.NhanVien;
import com.example.demo.model.repest.CreateNhanVien;
import com.example.demo.repository.NhanVienRepository;
import com.example.demo.service.ChucVuService;
import com.example.demo.service.NhanVienService;
import com.example.demo.service.impl.ChucVuServiceImpl;
import com.example.demo.service.impl.NhanVienServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/nhan-vien")
@CrossOrigin({"*"})
public class NhanVienController {

    @Autowired
    private NhanVienService nhanVienService = new NhanVienServiceImpl();

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private ChucVuService chucVuService = new ChucVuServiceImpl();

    @GetMapping("/show")
    public ResponseEntity hienThi(@RequestParam(defaultValue = "0") int pageNo) {
        Page<NhanVien> phanTrang = nhanVienRepository.findAll(PageRequest.of(pageNo, 3));
        return new ResponseEntity(phanTrang, HttpStatus.OK);
    }

    @GetMapping("/showChucVu")
    public ResponseEntity hienThiCV() {
        return new ResponseEntity(chucVuService.getAll(), HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity add(@RequestBody CreateNhanVien nhanVien) {
        return new ResponseEntity(nhanVienService.add(nhanVien), HttpStatus.CREATED);
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity detail(@PathVariable UUID id) {
        return new ResponseEntity(nhanVienService.getOne(id), HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable UUID id) {
        NhanVien nhanVien = nhanVienService.getOne(id);
        nhanVienService.delete(nhanVien);
    }

    @PutMapping("/update/{id}")
    public void update(@PathVariable("id") UUID id, @RequestBody CreateNhanVien nhanVien) {
        nhanVienService.update(nhanVien, id);
    }

//    @GetMapping("/search")
//    public ResponseEntity search(final NhanVien nhanVien) {
//        List<NhanVien> search = nhanVienService.search(nhanVien.getMa());
//        return new ResponseEntity(search, HttpStatus.OK);
//    }

    @GetMapping("/search")
    public ResponseEntity search(final NhanVien nhanVien) {
        List<NhanVien> search = nhanVienService.search(nhanVien.getMa() , nhanVien.getTen());
        return new ResponseEntity(search, HttpStatus.OK);
    }
}
