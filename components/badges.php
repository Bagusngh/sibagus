<?php
function hitungQty($koneksi, $nama_tabel){
    $select = "SELECT COUNT(*) qty FROM $nama_tabel";
    $result = mysqli_query($koneksi, $select);
    $row = mysqli_fetch_assoc($result);
    return $row['qty'];
}


$ruang_qty = hitungQty($koneksi, "ruang");
$karyawan_qty = hitungQty($koneksi, "karyawan");
$pemasok_qty = hitungQty($koneksi, "pemasok");
$barang_qty = hitungQty($koneksi, "barang");


?>
<div id="badges" class="row g-3 my-2">
    <div class="col-md-6 col-lg-3">
        <div class="p-3 hijo-bg shadow-sm d-flex justify-content-around align-items-center rounded">
            <div>
                <h3 class="fs-2"><?= $ruang_qty ?></h3>
                <p class="fs-5 text-white">Ruang</p>
            </div>
            <i class="fas fa-building fs-1 text-white hijo-bg p-3"></i>
        </div>
    </div>

    <div class="col-md-6 col-lg-3">
        <div class="p-3 secondary-bg shadow-sm d-flex justify-content-around align-items-center rounded">
            <div>
                <h3 class="fs-2"><?= $karyawan_qty ?></h3>
                <p class="fs-5 text-white">Karyawan</p>
            </div>
            <i class="fas fa-users fs-1 text-white secondary-bg p-3"></i>
        </div>
    </div>

    <div class="col-md-6 col-lg-3">
        <div class="p-3 bg-primary shadow-sm d-flex justify-content-around align-items-center rounded">
            <div>
                <h3 class="fs-2"><?= $pemasok_qty ?></h3>
                <p class="fs-5 text-white">Pemasok</p>
            </div>
            <i class="fas fa-money-bill fs-1 text-white bg-primary p-3"></i>
        </div>
    </div>

    <div class="col-md-6 col-lg-3">
        <div class="p-3 bg-danger shadow-sm d-flex justify-content-around align-items-center rounded">
            <div>
                <h3 class="fs-2"><?= $barang_qty ?></h3>
                <p class="fs-5 text-white">Barang</p>
            </div>
            <i class="fas fa-chart-line fs-1 text-white bg-danger p-3"></i>
        </div>
    </div>
</div>