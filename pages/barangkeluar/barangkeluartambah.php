<div id="atas" class="row mb-3">
    <div class="col">
        <div class="row">
            <div class="col-md-6">
                <h3>Tambah Data Barang Keluar</h3>
            </div>
            <div class="col-md-6">
                <a href="?page=barangkeluardata" class="btn btn-primary float-end">
                    <i class="fa fa-arrow-circle-left"></i> Kembali
                </a>
            </div>
        </div>
    </div>
</div>
<div id="tengah">
    <div class="col">
        <?php
        if (isset($_POST['simpan_button'])) {
            $tanggal = $_POST['tanggal'];
            $nama_barang = $_POST['nama_barang'];
            $jumlah = $_POST['jumlah'];
            $nama_pemohon = $_POST['nama_pemohon'];

            $insertSQL = "INSERT INTO barang_keluar SET tanggal='$tanggal', 
            kode_barang='$nama_barang', nama_pemohon='$nama_pemohon'";
            $result = mysqli_query($koneksi, $insertSQL);
            if (!$result) {
                ?>
                <div class="alert alert-danger" role="alert">
                    <i class="fa fa-exclamation-circle"></i>
                    <?= mysqli_error($koneksi) ?>
                </div>
                <?php
            } else {
                $lastInsertedId = mysqli_insert_id($koneksi);

                // Insert into barang_keluar_detail
                $insertDetailSQL = "INSERT INTO barang_keluar_detail SET 
            barang_keluar_id='$lastInsertedId', 
            barang_id='$nama_barang', 
            jumlah=$jumlah,  
            status_kode='Belum'";

                $resultDetail = mysqli_query($koneksi, $insertDetailSQL);
                if (!$resultDetail) {
                    ?>
                    <div class="alert alert-danger" role="alert">
                        <i class="fa fa-exclamation-circle"></i>
                        <?= mysqli_error($koneksi) ?>
                    </div>
                    <?php
                } else {
                    ?>
                    <div class="alert alert-success" role="alert">
                        <i class="fa fa-check-circle"></i>
                        Data berhasil ditambahkan
                    </div>
                    <?php
                }
            }
        }
        ?>
    </div>
</div>
<div id="bawah" class="row">
    <div class="col">
        <form action="" method="post">
            <div class="card px-3 py-3">
                <div class="row">
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label for="id">Tanggal</label>
                            <input type="date" name="tanggal" class="form-control" required
                                value="<?= date("Y-m-d") ?>">
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="mb-3">
                            <label for="id">Nama Barang</label>
                            <?php
                            if ($_SESSION["level"] == "admin") {
                                $selectSQLBarang = "SELECT * FROM barang";
                                $resultSetBarang = mysqli_query($koneksi, $selectSQLBarang);
                                ?>
                                <select name="nama_barang" id="" class="form-control">
                                    <option value="">-- Pilih --</option>
                                    <?php
                                    while ($rowBarang = mysqli_fetch_assoc($resultSetBarang)) {
                                        ?>
                                        <option value="<?= $rowBarang["kode_barang"] ?>">
                                            <?= $rowBarang["nama_barang"] ?>
                                        </option>
                                        <?php
                                    }
                                    ?>
                                </select>
                                <?php
                            } else {
                                ?>
                                <input type="hidden" class="form-control" name="karyawan_id"
                                    value="<?= $_SESSION["karyawan_id"] ?>">
                                <input type="text" class="form-control" value="<?= $_SESSION["nama_karyawan"] ?>" readonly>
                                <?php
                            } ?>
                        </div>
                    </div>
                </div>
                <?php
                $selectSQLPemasok = "SELECT * FROM pemasok";
                $resultSetPemasok = mysqli_query($koneksi, $selectSQLPemasok);
                ?>
                <div class="row">

                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="id">Jumlah </label>
                            <div class="input-group">
                                <input type="number" id="jumlah" name="jumlah" class="form-control" value="0" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="id">Nama Pemohon </label>
                            <?php
                            $nama_list = [
                                "Dr. AHMAD SUHAIMI, S.Sos,S.H.,M.H,M.M",
                                "RIZKI INTAN AMRIYANI, S.H.",
                                "MUHAMMAD HELMY FAUZIE, S.SiT",
                                "ALKAF, S.SiT, S.H.,M.M",
                                "DYAH RUSTANTI, S.Sos.",
                                "FAJAR SETIYAWAN, S.Sos",
                                "SITI MAGFIROH",
                                "EVY DIYANTI",
                                "PARIS RINALDI, S.H.",
                                "ALFISYAHRIN FIRDAUS, S.H.",
                                "MUHAMMAD R. SYA'BANA, S.H.",
                                "MUHAMMAD INDRA PRATAMA SAPUTRA , S.H.,M.H.",
                                "SITI YUNIATUN, S.H.",
                                "USHFIA MUFIDA, S.T.",
                                "ALISA, S.H.",
                                "DEDE RAHMAN, S.Tr.",
                                "DWI FAJAR WICAKSONO, S.TP",
                                "AYNANI RIFANI",
                                "M. RIAN ZAKARIA, S.H",
                                "MUHAMMAD RISKY, A.Md.",
                                "NORLATIFAH",
                                "AKHMAT PARID",
                                "FARID HIDAYAT, A.P.,S.H.",
                                "RUSMANANDA ADITYA PRATIWI, A.P.,S.H.",
                                "HARJUNANDA PUTRA, A.P.",
                                "RIO SETYA KUSUMA AJI, A.P.",
                                "AYU LESTARI, A.P.",
                                "FARIZ JORDY,S.Ak.",
                                "QONITA AMALIA SYAFURA, A.P.",
                                "FITRIA PATMAWATI, S.H.",
                                "KHAIRATUNNISA, S.H.",
                                "MUHAMMAD RIZALDY AKMAL, S.H.",
                                "SYARIFAH RAMADHANAH, S.Ak",
                                "AIN MUTHAHARA, A.Md",
                                "HANIN PANGESTI, A.Md",
                                "RAMDANI RAHMAN, A.Md",
                                "MUHAMMAD IHSAN, S.H. NI PPPK.",
                                "MUHAMMAD SANUSI, S.Kom",
                                "MARPUAH, S.E",
                                "AHMAD FAUJI, S.Kom",
                                "ASTRINDYA YORANDA",
                                "AULIA RAFIKA DEWI",
                                "DELIYANTI",
                                "MUHAMAD RIFKY",
                                "ALFINA HANDINI",
                                "DENNY PRATIWI",
                                "IMAM ARIFIN",
                                "KHAIRATUN NISA",
                                "MAEISYAROH",
                                "RATNA NINGSIH",
                                "SANIYAH HARTINA APRIL YANI",
                                "KHADIJAH",
                                "MUHAMMAD RIZKY ALDIANOOR",
                                "NUR ANNISA PUTRI",
                                "DINA RIDANI",
                                "EDI NURLISTIADI",
                                "ERWIN WIDAYANTI",
                                "ERYDA WIJAYANTI",
                                "FERDY ANGGARA",
                                "RISENNA MEGANANDA LUTVIANI",
                                "ZAHIR SAPUTERA",
                                "BAGUS NUGROHO",
                                "KARIMATUL MUNAWARAH",
                                "DANA AFIA",
                                "SITI AISYAH",
                                "DELLA RIZKY APRIANA",
                                "ACHMAD SEPTYAN",
                                "FATHUL HAIR",
                                "SELAMAT ARIF WAHIDIN",
                                "RIANTO",
                                "EDI RIYANTO",
                                "ACHMAD YADI",
                                "SUPIANOOR",
                                "MUHAMMAD FAISAL ANDRI",
                                "BAYU CANDRA PRATAMA",
                                "RURI KURNIAWAN",
                                "NONA OVELIA PRASETYO",
                                "RESTI KUSUMA PUTRI",
                                "MUHAMMAD RISWANDA ADITYA PUTERA"
                            ];

                            // Membuat elemen <select> dan menambahkan pilihan dari daftar nama
                            echo '<select class="form-select" name="nama_pemohon" required>';
                            echo '<option value="">-- Pilih --</option>'; // Opsi kosong pertama
                            
                            foreach ($nama_list as $nama) {
                                echo '<option value="' . $nama . '">' . $nama . '</option>';
                            }

                            echo '</select>';
                            ?>
                        </div>
                    </div>
                    <div class="col mb-3">
                        <button class="btn btn-success" type="submit" name="simpan_button">
                            <i class="fas fa-save"></i>
                            Simpan
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>