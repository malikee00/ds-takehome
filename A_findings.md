Analisis dimulai dengan segmentasi pelanggan menggunakan metrik RFM (Recency, Frequency, Monetary). Dari hasil klasifikasi, pelanggan terbagi ke dalam enam segmen utama:  
(1) **Recent Buyer**, yang baru melakukan pembelian dalam 30 hari terakhir;  
(2) **Loyal High Spender**, pelanggan dengan ≥10 transaksi dan total pembelian ≥1000;  
(3) **Frequent Buyer**, ≥10 transaksi dengan nilai belanja <1000;  
(4) **Big Spender**, nilai belanja ≥1000 tetapi frekuensi <10;  
(5) **At Risk**, pelanggan yang tidak aktif >300 hari;  
(6) **Others**, yaitu pelanggan yang tidak termasuk dalam kelima kriteria tersebut.

Deteksi anomali berdasarkan selisih absolut antara `payment_value` dan `decoy_noise`, dengan threshold IQR 86.32. Anomali terbanyak ditemukan pada decoy C (2.96%) dan D (2.93%).

Analisis pembelian ulang bulanan menunjukkan pola loyalitas yang dapat dimanfaatkan untuk strategi retensi dan evaluasi diskon.
