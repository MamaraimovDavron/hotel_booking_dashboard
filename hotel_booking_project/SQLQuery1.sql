--1-step.
--1. Jami qatorlar soni

--SELECT COUNT(*) AS JAMI_BRONLAR
--FROM hotel_booking

--2. Birinchi 10 qatorni ko`rish

--SELECT TOP 10 *
--FROM hotel_booking

--3. Ustunlar ro`yhati.

--SELECT COLUMN_NAME, DATA_TYPE 
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'hotel_booking'

--2-step. NULL larni tekshirish

--SELECT 
--	SUM(CASE WHEN hotel IS NULL THEN 1 ELSE 0 END) AS hotel_null,
--	SUM(CASE WHEN country IS NULL OR country = '' THEN 1 ELSE 0 END) AS country_null,
--	SUM(CASE WHEN agent IS NULL THEN 1 ELSE 0 END) AS AGENT_NULL,
--	SUM(CASE WHEN company IS NULL THEN 1 ELSE 0 END) AS COMPANY_NAME,
--	SUM(CASE WHEN children IS NULL THEN 1 ELSE 0 END) AS CHILDREN_NULL,
--	SUM(CASE WHEN adr IS NULL THEN 1 ELSE 0 END) AS ADR_NULL
--FROM hotel_booking

--3-step. Nullarni tozalash

--country bo`sh bo`lsa 'Unknown' qo`yish

--UPDATE hotel_booking
--SET country = 'Unknown'
--WHERE country IS NULL;

-- children Null bo`lsa 0 qo`yish

--UPDATE hotel_booking
--SET children = 0
--WHERE children IS NULL;

-- agent NULL bo`lsa 0 qo`yish

--UPDATE hotel_booking
--SET agent = 0
--WHERE agent IS NULL;

-- company NULL bo`lsa 0 qo`yish 

--UPDATE hotel_booking
--SET company = 0
--WHERE company IS NULL;

-- qolgan ustunlarniyam null yoki emasligini tekshiramiz

--SELECT
--    SUM(CASE WHEN lead_time IS NULL THEN 1 ELSE 0 END) AS lead_time_null,
--    SUM(CASE WHEN arrival_date_year IS NULL THEN 1 ELSE 0 END) AS year_null,
--    SUM(CASE WHEN arrival_date_month IS NULL THEN 1 ELSE 0 END) AS month_null,
--    SUM(CASE WHEN stays_in_weekend_nights IS NULL THEN 1 ELSE 0 END) AS weekend_null,
--    SUM(CASE WHEN stays_in_week_nights IS NULL THEN 1 ELSE 0 END) AS weeknight_null,
--    SUM(CASE WHEN adults IS NULL THEN 1 ELSE 0 END) AS adults_null,
--    SUM(CASE WHEN babies IS NULL THEN 1 ELSE 0 END) AS babies_null,
--    SUM(CASE WHEN meal IS NULL THEN 1 ELSE 0 END) AS meal_null,
--    SUM(CASE WHEN market_segment IS NULL THEN 1 ELSE 0 END) AS market_null,
--    SUM(CASE WHEN distribution_channel IS NULL THEN 1 ELSE 0 END) AS distribution_null,
--    SUM(CASE WHEN is_repeated_guest IS NULL THEN 1 ELSE 0 END) AS repeated_null,
--    SUM(CASE WHEN reserved_room_type IS NULL THEN 1 ELSE 0 END) AS reserved_room_null,
--    SUM(CASE WHEN assigned_room_type IS NULL THEN 1 ELSE 0 END) AS assigned_room_null,
--    SUM(CASE WHEN deposit_type IS NULL THEN 1 ELSE 0 END) AS deposit_null,
--    SUM(CASE WHEN customer_type IS NULL THEN 1 ELSE 0 END) AS customer_null,
--    SUM(CASE WHEN reservation_status IS NULL THEN 1 ELSE 0 END) AS status_null,
--    SUM(CASE WHEN reservation_status_date IS NULL THEN 1 ELSE 0 END) AS status_date_null
--FROM hotel_booking;

-- adr manfiy bo`lmasligi kerak, avval noto`g`ri qiymatlar bormi tekshirish

--SELECT COUNT(*) AS [noto`g`ri_qiymat] 
--FROM hotel_booking
--WHERE ISNUMERIC(adr) = 0;

-- adr ustunini float ga o'tkazish
--ALTER TABLE hotel_booking
--ALTER COLUMN adr FLOAT;

--SELECT COUNT(*) AS MANFIY_ADR FROM hotel_booking
--WHERE adr < 0

--SELECT * 
--FROM hotel_booking
--WHERE ISNUMERIC(ADR) = 0

-- bo`sh adr ni 0 ga o`zgartirish

--UPDATE hotel_booking
--SET adr = '0'
--WHERE adr = '' OR adr IS NULL;

-- adr ustunini floatga o`tkazish

--ALTER TABLE hotel_booking
--ALTER COLUMN adr FLOAT;

--SELECT COUNT(*) AS MANFIY_ADR FROM hotel_booking
--WHERE adr < 0

--adr dagi manfiy sonni topamiz

--select * from hotel_booking
--where adr < 0

--UPDATE hotel_booking
--SET adr = 0
--WHERE adr < 0;

--BO`SH QIYMATLARNI 0 GA O`ZGARTIRAMIZ

--UPDATE hotel_booking SET adults = '0' WHERE adults = '' OR adults IS NULL;
--UPDATE hotel_booking SET children = '0' WHERE children = '' OR children IS NULL;
--UPDATE hotel_booking SET babies = '0' WHERE babies = '' OR babies IS NULL;
--UPDATE hotel_booking SET stays_in_weekend_nights = '0' WHERE stays_in_weekend_nights = '' OR stays_in_weekend_nights IS NULL;
--UPDATE hotel_booking SET stays_in_week_nights = '0' WHERE stays_in_week_nights = '' OR stays_in_week_nights IS NULL;

--BULARNING BARCHASINI INT DATA TYPE O`GIRAMIZ

--ALTER TABLE hotel_booking ALTER COLUMN adults FLOAT;
--ALTER TABLE hotel_booking ALTER COLUMN children FLOAT;
--ALTER TABLE hotel_booking ALTER COLUMN babies FLOAT;
--ALTER TABLE hotel_booking ALTER COLUMN stays_in_weekend_nights FLOAT;
--ALTER TABLE hotel_booking ALTER COLUMN stays_in_week_nights FLOAT;


--ALTER TABLE hotel_booking ALTER COLUMN adults INT;
--ALTER TABLE hotel_booking ALTER COLUMN children INT;
--ALTER TABLE hotel_booking ALTER COLUMN babies INT;
--ALTER TABLE hotel_booking ALTER COLUMN stays_in_weekend_nights INT;
--ALTER TABLE hotel_booking ALTER COLUMN stays_in_week_nights INT;

--mehmon soni 0 bo`lgan bronlar

--SELECT COUNT(*) AS NO_GUESTS FROM hotel_booking
--WHERE adults = 0 AND children = 0 AND babies = 0


--KECHALAR SONI 0 BO`LGAN BRONLAR

--SELECT COUNT(*) AS NO_NIGHTS FROM hotel_booking
--WHERE stays_in_week_nights = 0 AND stays_in_weekend_nights = 0

-- JAMI 180 TA MEHMON BO`LMAGAN BRON, 715 TA KECHA BRON YO`Q EKAN, SHUNING UCHUN ULARNI O`CHIRAMIZ. SABABI, KECHA HAM MEHMON YO`Q DEGANI MANTIQSIZDIR.

--MEHMON YOQ BRONLARNI O`CHIRISH

--DELETE FROM hotel_booking
--WHERE adults = 0 AND children = 0 AND babies = 0

-- KECHA YO`Q BRONLARNI O`CHIRISH

--DELETE FROM hotel_booking
--WHERE stays_in_week_nights = 0 AND stays_in_weekend_nights = 0

--SELECT COUNT(*) FROM hotel_booking

-- ENDI DUPLICATLARNI TEKSHIRAMIZ

--SELECT
--	name,
--	email,
--	phone_number,
--	credit_card,
--	COUNT(*) AS TAKRORLANISH_SONI
--FROM hotel_booking
--GROUP BY name,
--	email,
--	phone_number,
--	credit_card
--HAVING COUNT(*) > 1

--DATA CLEANING QISMI TUGADI, ENDI ANALYSIS QISMIGA O`TAMIZ

--1. UMUMIY STATISTIKA

-- JAMI BRONLAR SONI
-- BEKOR QILINGANLAR SONI FOIZI
-- MUVAFFAQIYATLI BRONLAR
-- O`RTACHA OLDINDAN BRON QILISH VAQTI
-- O`RTACHA QOLADIGAN KECHALAR SONI

--SELECT * FROM hotel_booking

--SELECT 
--	COUNT(*) AS JAMI_BRONLAR,
--	SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS BEKOR_QILINGAN,
--	SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS MUVAFFAQIYATLI,
--	ROUND(SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS BEKOR_QILINGANLAR_FOIZDA,
--	ROUND(AVG(CAST(lead_time AS float)),2) AS ORTACHA_LEAD_TIME,
--	ROUND(AVG(stays_in_week_nights + stays_in_weekend_nights),2) AS ORTACHA_KECHALAR
--FROM hotel_booking

-- bronlar 118,565, 
-- Bekor qilingan 44,176
-- Muvaffaqiyatli 74,389
-- Bekor qilish foizi 37.26%
-- O'rtacha lead time 104.51 kun
-- O'rtacha kechalar 3 kecha


-- 2-TASK: Eng ko'p bron qilingan oylar

--SELECT 
--	arrival_date_month AS OY,
--	COUNT(*) AS BRONLAR_SONI
--FROM hotel_booking
--GROUP BY arrival_date_month
--ORDER BY BRONLAR_SONI DESC

-- 🔥 Yoz oylari (July, August) — eng band davr, ya'ni yozgi ta'til sezoni
-- 📈 Aprel, May — bahor ham qizg'in
-- ❄️ Dekabr, Yanvar — eng past, qishda kam mehmon


-- 3-Task. City Hotel vs Resort Hotel - qaysi biri ko`proq bron qilingan?

--select 
--	hotel,
--	count(hotel) 
--from hotel_booking
--group by hotel

-- Xulosam shundan iboratki, City Hotel 2 barabar ko`p bron qilingan.

-- 4-Task. Qaysi mehmonxona turida bekor qilish ko`proq? Fozi bilan

--select 
--	hotel,
--	COUNT(*) as jami,
--	SUM(CAST(is_canceled AS INT)) as bekor_qilingan,
--	ROUND(SUM(CAST(is_canceled AS INT)) * 100.0 / COUNT(*),2) as bekor_foizi
--from hotel_booking
--group by hotel;

-- Xulosa, City Hotel da bekor qilish 13.9% ko`proq
-- Resort Hotelda mehmonlar bronni kamroq bekor qilishadi
-- City Hotel ko`proq biznes sayohatchilar-ular rejalari tez-tez o`zgarishi mumkin

-- 5-Task. Top 10 mamlakat-qayerdan eng ko`p mehmon kelgan?

--select 
--	top 10 country, 
--	COUNT(country) as cnt_country
--from hotel_booking
--group by country
--order by COUNT(country) desc

-- Xulosa. Portugale - 47943 ta bron bilan 1-o`rinda, bu mehmonxonalar Portugaliyada joylashgan degan ma`noni bildiradi.
-- Qolgan 8top 10 ning 8 tasi Yevropa davlatlari
-- Brazil - yagona Yevropa bo`lmagan davlat top 10 da

--6-Task. Oylar bo`yicha o`rtacha ADR (narxi) tahlili

--select 
--	arrival_date_month,
--	round(AVG(adr),2)
--from hotel_booking
--group by arrival_date_month
--order by round(AVG(adr),2) desc

-- Xulosa, yoz oylari - narx ham eng yuqori, talab ham eng yuqori.
-- Yanvar - eng arzon, 71.05 $ - qishda narx 2 barabar tushadi
-- Avgust va Yanvar orasida 69.70 $ farq bor.

-- Task 2 va Task 6 ni solishtirish
-- Eng ko`p bron - Avgust
-- Eng yuqori narx - Avgust

-- Task 7. Lead time tahlili - oldindan bron qilish bekor qilishga ta`sir qiladimi?

--select 
--	 CASE 
--		WHEN lead_time BETWEEN 0 and 30 then '0-30 kun oldin bron qilganlar'
--		WHEN lead_time BETWEEN 31 and 90 then '31-90 kun oldin bron qilganlar'
--		WHEN lead_time BETWEEN 91 and 180 then '91-180 kun oldin bron qilganlar'
--		WHEN lead_time > 181 then '181 kun oldin bron qilganlar'
--		else 'Boshqa'
--	end as lead_time_guruh,
--	COUNT(*) as jami,
--	SUM(CAST(is_canceled AS INT)) as bekor_qilingan,
--	ROUND(SUM(CAST(is_canceled AS INT)) * 100.0 / COUNT(*), 2) as bekor_foizi
--from hotel_booking
--group by CASE 
--		WHEN lead_time BETWEEN 0 and 30 then '0-30 kun oldin bron qilganlar'
--		WHEN lead_time BETWEEN 31 and 90 then '31-90 kun oldin bron qilganlar'
--		WHEN lead_time BETWEEN 91 and 180 then '91-180 kun oldin bron qilganlar'
--		WHEN lead_time > 181 then '181 kun oldin bron qilganlar'
--		else 'Boshqa'
--	end
--order by bekor_qilingan desc

--Xulosa: 
-- ⏰ 0-30 kun — eng kam bekor qilish 18.77%
-- 📅 181+ kun — eng ko'p bekor qilish 57.14%
-- Har guruhda bekor qilish foizi ketma-ket o'sib bormoqda — bu aniq trend!

-- Task 8. Mehmon turlari - oilaviya, juftlik, yolg`iz mehmonlar nisbati.

--select 
--	oilaviy_holat,
--	jami,
--	ROUND(jami * 100.0 / SUM(jami) OVER(), 2) as foiz
--	from (
--select 
--	case 
--		when adults = 1 and children = 0 and babies = 0 then 'Yolg`iz'
--		when adults = 2 and children = 0 and babies = 0 then 'Juftlik'
--		when children > 0 OR babies > 0 then 'Oilaviy'
--		else 'Boshqa'
--	end oilaviy_holat,
--	COUNT(*) as jami

--from hotel_booking
--group by case 
--		when adults = 1 and children = 0 and babies = 0 then 'Yolg`iz'
--		when adults = 2 and children = 0 and babies = 0 then 'Juftlik'
--		when children > 0 OR babies > 0 then 'Oilaviy'
--		else 'Boshqa'
--	end
--) as t

--Task 9. Revenue tahlili-har oyda taxminy daromad

--select 
--ROUND(SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)),2) as jami_daromad,
--	arrival_date_month
--from hotel_booking
--group by arrival_date_month
--order by jami_daromad desc

-- Xulosa, kutilganidek avgust 1-o`rinda

-- Task 10. Qayta keluvchi mehmonlar - qaysi kanaldan kelgan

--select 
--	market_segment,
--	jami,
--	round(jami * 100.0 / SUM(jami) OVER(),2 ) as foiz
--	from
--(
--	select 
--		market_segment,
--		COUNT(*) as jami
--	from hotel_booking
--	where is_repeated_guest = 1
--	group by market_segment
--	) as t

-- Xulosa, Ish bilan keluvchilar soni oldinda

--ALTER TABLE hotel_booking
--ADD month_num INT;

--UPDATE hotel_booking
--SET month_num = 
--	CASE arrival_date_month
--		WHEN 'January' THEN 1
--		WHEN 'February' THEN 2
--		WHEN 'March' THEN 3
--		WHEN 'April' THEN 4
--		WHEN 'May' THEN 5
--		WHEN 'June' THEN 6
--		WHEN 'July' THEN 7
--		WHEN 'August' THEN 8
--		WHEN 'September' THEN 9
--		WHEN 'October' THEN 10
--		WHEN 'November' THEN 11
--		WHEN 'December' THEN 12
--	END;
