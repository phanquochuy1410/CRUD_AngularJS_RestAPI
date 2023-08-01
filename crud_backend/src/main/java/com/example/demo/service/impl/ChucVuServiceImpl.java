package com.example.demo.service.impl;

import com.example.demo.entity.ChucVu;
import com.example.demo.repository.ChucVuRepository;
import com.example.demo.service.ChucVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChucVuServiceImpl implements ChucVuService {

    @Autowired
    private ChucVuRepository chucVuRepository;

    @Override
    public List<ChucVu> getAll() {
        return chucVuRepository.findAll();
    }
}
