Proses deteksi anomali ini dilakukan dengan menghitung selisih absolut antara payment_value dan decoy_noise. Threshold ditentukan secara statistik menggunakan metode Interquartile Range (IQR), dengan hasil threshold sebesar 86.32. Transaksi yang memiliki selisih di atas nilai tersebut dianggap sebagai anomali.

Dari total 10.000 transaksi, ditemukan sejumlah anomali tersebar pada empat kategori decoy flag (A–D). Analisis lebih lanjut menunjukkan bahwa decoy C memiliki proporsi anomali tertinggi, yaitu sebesar 2.96% dari total transaksinya, diikuti oleh decoy D (2.93%), B (2.82%), dan A (2.49%).

Temuan ini menunjukkan bahwa variasi pada decoy tertentu cenderung menghasilkan ketidaksesuaian signifikan terhadap nilai pembayaran, yang bisa mengindikasikan potensi noise atau error sistem.

Insight Bisnis:

Deteksi anomali memainkan peran krusial dalam mengidentifikasi pola-pola outlier yang berpotensi merugikan, seperti kesalahan dalam sistem penetapan harga, manipulasi harga, dan perilaku pengguna yang tidak wajar. Penelitian oleh Safa et al. menunjukkan bahwa manipulasi harga saham dapat secara signifikan mengganggu integritas pasar dan kepercayaan investor, serta berdampak langsung terhadap efisiensi dan stabilitas sistem keuangan (Safa et al., 2024).

Proporsi anomali yang lebih tinggi yang terdeteksi pada skenario tertentu seperti decoy C dan D dalam konteks eksperimen, dapat dijadikan sebagai sinyal awal untuk mengaudit kembali strategi penetapan harga dan prosedur internal yang digunakan. Penelitian ini menegaskan bahwa pendekatan berbasis deep learning, khususnya kombinasi recurrence plots dan variational autoencoder, mampu mengidentifikasi manipulasi harga dengan presisi tinggi dan false alarm yang rendah. Hal ini memberikan landasan kuat untuk meningkatkan proses validasi data, serta meninjau ulang skema diskon, eksperimen harga, atau segmentasi berbasis aturan yang digunakan dalam sistem.

Jika ketidaksesuaian ini tidak segera ditangani, implikasinya bisa meliputi kerugian finansial yang substansial, hilangnya kepercayaan pengguna, serta inefisiensi operasional yang berdampak luas terhadap ekosistem bisnis digital secara keseluruhan.

Referensi: *Stock Price Manipulation Detection using Variational Autoencoder and Recurrence Plots* oleh [Safa et al., 2024](https://drive.google.com/file/d/13ov7DUN90u8tbWNAGefF4KX4D2w2UTMyL/view?usp=sharing)
