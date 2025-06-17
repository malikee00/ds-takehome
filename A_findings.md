Analisis dimulai dengan segmentasi pelanggan menggunakan metrik RFM (Recency, Frequency, Monetary). Dari hasil klasifikasi, pelanggan terbagi ke dalam enam segmen utama: 

(1) Recent Buyer, yang baru melakukan pembelian dalam 30 hari terakhir; 

(2) Loyal High Spender, pelanggan dengan ≥10 transaksi dan total pembelian ≥1000; 

(3) Frequent Buyer, dengan ≥10 transaksi namun nilai belanja <1000; 

(4) Big Spender, nilai belanja ≥1000 tetapi jumlah transaksi <10; 

(5) At Risk, pelanggan yang tidak aktif >300 hari; dan (6) Others.

Deteksi anomali dilakukan dengan menghitung selisih absolut antara `payment_value` dan `decoy_noise`, menggunakan threshold IQR sebesar 86.32. Anomali terbanyak terdeteksi pada decoy C (2.96%) dan D (2.93%).

Terakhir, analisis pembelian ulang bulanan menunjukkan fluktuasi loyalitas pelanggan yang dapat dimanfaatkan untuk strategi retensi dan evaluasi eksperimen harga.
