# Project Management Database (SQL Server)

Sistem i plotë i bazës de të dhënave relacionale për menaxhimin e projekteve software, detyrave, punonjësve, klientëve dhe teknologjive.

## Përmbledhja e Projektit
Ky projekt u ndërtua për të strukturuar dhe administruar rrjedhën e punës në një mjedis zhvillimi software. Ai mbulon gjithë ciklin e lidhjeve mes burimeve njerëzore, kohëzgjatjes së detyrave, teknologjive të përdorura dhe klientëve porositës.

## Karakteristikat & Arkruktura e Databazës
* **Modelimi E/R:** Krijimi i skemës relacionale dhe menaxhimi i marrëdhënieve komplekse (përfshirë lidhjet N:M përmes entitetit ndërmjetës `ProjektTeknologji`).
* **Integriteti i të Dhënave:** Zbatimi i rreptë i çelësave primarë dhe të huaj (PK/FK) për të garantuar konsistencën e informacionit.
* **Query & Raportime:** Përdorimi i shprehjeve T-SQL dhe operatorëve `JOIN` për nxjerrjen e raporteve në kohë reale mbi ecurinë e projekteve dhe ngarkesën e punonjësve.

## Teknologjitë e Përdorura
* **Baza e Të Dhënave:** Microsoft SQL Server
* **Mjedisi i Punës:** SQL Server Management Studio (SSMS)
* **Gjuha:** T-SQL
