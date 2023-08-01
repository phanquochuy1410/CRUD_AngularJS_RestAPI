package com.example.demo.model.repest;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class CreateNhanVien {

    @NotBlank
    private String ma;

    @NotBlank
    private String ten;

    @NotBlank
    private String sdt;

    @NotNull
    private UUID idChucVu;
}
