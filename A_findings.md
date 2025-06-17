Deteksi anomali dilakukan dengan menghitung selisih absolut antara `payment_value` dan `decoy_noise`, menggunakan threshold statistik berbasis IQR (86.32). Transaksi dengan selisih di atas nilai ini dianggap anomali. Dari 10.000 transaksi, proporsi anomali tertinggi terdapat pada decoy C (2.96%) dan D (2.93%).

Temuan ini mengindikasikan bahwa variasi pada skenario decoy tertentu memicu ketidaksesuaian terhadap nilai pembayaran, yang dapat mencerminkan noise sistem atau potensi error pricing. Insight ini relevan untuk audit ulang strategi penetapan harga atau prosedur validasi diskon.

Penelitian oleh [Safa et al. (2024)](https://ieeexplore.ieee.org/document/10650234) menunjukkan bahwa pendekatan deep learning seperti variational autoencoder dan recurrence plots efektif mendeteksi manipulasi harga dengan presisi tinggi. Hal ini mendukung pentingnya validasi data berbasis statistik dan machine learning guna menjaga efisiensi sistem dan kepercayaan pengguna.
