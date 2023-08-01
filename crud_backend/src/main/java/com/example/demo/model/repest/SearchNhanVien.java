package com.example.demo.model.repest;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchNhanVien {

    @NotBlank
    private String ma;

    @NotBlank
    private String ten;

    @NotBlank
    private String sdt;

}
