# Data Warehouse & OLAP Crime Analysis in India (2020–2024)

## Team Members
| Role | Name | NIM |
|------|------|------|
| Ketua | Yanaka Sofia Pardede | 24031554065 |
| Anggota | Annisa Ramadhani | 24031554206 |
| Anggota | Ayu Wulan Anggraeni Putri | 24031554177 |

## Project Overview
Proyek ini bertujuan membangun Data Warehouse dan melakukan analisis OLAP terhadap data kriminalitas di India periode 2020–2024. Analisis dilakukan untuk memahami pola kriminalitas berdasarkan dimensi waktu, lokasi, karakteristik korban, kategori kejahatan, serta penggunaan senjata.
Dataset diolah menggunakan proses ETL (Extract, Transform, Load), kemudian disusun ke dalam model Star Schema untuk mendukung analisis multidimensi dan visualisasi dashboard.

## Dataset Information
- Dataset: Indian Crimes Dataset
- Source : https://www.kaggle.com/datasets/sudhanvahg/indian-crimes-dataset
- Total Records : 40,160
- Total Attributes : 14

### Main Attributes
- Report Number
- Date Reported
- Date of Occurrence
- City
- Crime Description
- Crime Domain
- Victim Age
- Victim Gender
- Weapon Used
- Police Deployed
- Case Closed
- Date Case Closed

# ETL Process
## Extract
Dataset dibaca dari file CSV menggunakan Python dan Pandas.

## Transform
Tahapan transformasi meliputi:
- Konversi atribut tanggal ke format datetime
- Penanganan missing value
- Pembuatan atribut waktu (Year, Quarter, Month, Day)
- Perhitungan Resolution Days
- Pembentukan tabel dimensi
- Pembentukan tabel fakta

## Load
Data dimuat ke lingkungan OLAP menggunakan Atoti dan PostgreSQL untuk kebutuhan analisis serta visualisasi dashboard.

# Data Warehouse Design
## Star Schema
### Fact Table
**Fact Crime**
Measure:
- crime_count
- police_deployed
- resolution_days

### Dimension Tables
#### Dim Date
- year
- quarter
- month
- month_name
- day
- holiday_type
#### Dim City
- city
#### Dim Crime
- crime_description
- crime_domain
#### Dim Victim
- victim_gender
- age_group
#### Dim Weapon
- weapon_used

# OLAP Analysis
Analisis yang dilakukan:
1. Total Crime per Year
2. Top 10 City by Total Crime
3. Crime Domain vs Total Crime
4. Victim Gender vs Total Crime
5. Age Group vs Total Crime
6. Weapon Used vs Total Crime
7. Crime Domain vs Average Resolution Days
8. City vs Average Resolution Days
9. Age Categories vs Total Crime
10. Holiday Type vs Crime Domain
11. Holiday Type vs Total Crime

# Dashboard Visualization
Dashboard dibuat menggunakan Looker Studio dengan visualisasi:
| No | Visualization |
|----|--------------|
| 1 | Total Crime per Year |
| 2 | Victim Gender vs Total Crime |
| 3 | Top 10 City by Total Crime |
| 4 | Crime Domain vs Total Crime |
| 5 | Age Group vs Total Crime |
| 6 | Weapon Used vs Total Crime |
| 7 | Crime Domain vs Average Resolution Days |
| 8 | City vs Average Resolution Days |
| 9 | Age Categories vs Total Crime |
| 10 | Holiday Type vs Crime Domain |
| 11 | Holiday Type vs Total Crime |

# Key Findings
- Jumlah kasus kriminal relatif stabil pada periode 2020–2023.
- Delhi menjadi kota dengan jumlah kasus kriminal tertinggi.
- Other Crime merupakan kategori kejahatan yang paling dominan.
- Korban perempuan tercatat lebih banyak dibandingkan laki-laki.
- Kelompok usia lansia memiliki jumlah korban tertinggi.
- Knife menjadi senjata yang paling sering digunakan.
- Violent Crime membutuhkan waktu penyelesaian paling lama.
- Republic Day memiliki proporsi kriminalitas tertinggi dibanding hari besar lainnya.
