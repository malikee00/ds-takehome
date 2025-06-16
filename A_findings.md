Proses deteksi anomali ini dilakukan dengan menghitung selisih absolut antara payment_value dan decoy_noise. Threshold ditentukan secara statistik menggunakan metode Interquartile Range (IQR), dengan hasil threshold sebesar 86.32. Transaksi yang memiliki selisih di atas nilai tersebut dianggap sebagai anomali.

Dari total 10.000 transaksi, ditemukan sejumlah anomali tersebar pada empat kategori decoy flag (A–D). Analisis lebih lanjut menunjukkan bahwa decoy C memiliki proporsi anomali tertinggi, yaitu sebesar 2.96% dari total transaksinya, diikuti oleh decoy D (2.93%), B (2.82%), dan A (2.49%).

Temuan ini menunjukkan bahwa variasi pada decoy tertentu cenderung menghasilkan ketidaksesuaian signifikan terhadap nilai pembayaran, yang bisa mengindikasikan potensi noise atau error sistem.
