%let pgm=utl-altair-slc-k-mediods-clustering-using-r;

%stop_submission;

Altair slc k mediods clustering using r

Too long to post on a list,see github
https://github.com/rogerjdeangelis/utl-altair-slc-k-mediods-clustering-using-r

Graphic output
https://github.com/rogerjdeangelis/utl-altair-slc-k-mediods-clustering-using-r/blob/main/mediods.png
https://github.com/rogerjdeangelis/utl-altair-slc-k-mediods-clustering-using-r/blob/main/silhouette.png

The graph uses factor analysis to reduce the dimensionality for visualization of four dimesional data.

PROBLEM IDENTIFY THE FOUR DIEMSIONAL MEDOIDS FOR THREE CLUSTERS

ONE APPLICATION: PROFILE PATIENTS INTO GROUPS

For the iris data the medoids are the observered points in four dimensional space,
Sepal_Length, Sepal_Width, Petal_Length, and Petal_Width,
that minimize the distance to all other points in the cluster.

HERE ARE THE FOUR DIMENSIONAL OBSERVED MEDIODS

         SEPAL_     SEPAL_    PETAL_    PETAL_
CLUSTER  LENGTH     WIDTH    LENGTH     WIDTH

 1         5.0       3.4       1.5       0.2
 2         6.0       2.9       4.5       1.5
 3         6.8       3.0       5.5       2.1

Note we are tring to identify three cluster without using the species variable.
We are using medoids based clusters, handles outliers better?
Species is hardcoded for display purposes only, species was not used to identify clusters.

I HARDCORED THE SPECIES, COULD HAVE LABELED CATEGORY1-3.

CLUSTER SETOSA VERSICOLOR VIRGINICA

    1       50          0         0
    2        0         48        14
    3        0          2        36


community post
https://community.altair.com/discussion/49353/k-medoids-in-rapidminer/p1?tab=all

Note we are tring to identify three specias cluster iformation on the species.
We are using median based clusters, handles outliers better?
Species is hardcoded for display purposes only, specias was not used to identify clusters.


Confirms K-Medoids result
Multidimensional Scaling to reveal underlying structures in the data.
https://github.com/rogerjdeangelis/altair-slc-r-simple-random-forest-classification-example-using-iris-dataset

                        Dimension 1
        -5.0     -2.5      0.0      2.5      5.0
      2 +-+--------+--------+--------+--------+--+ 2
        |                                        |
        |          +    + Setosa        X        |
   D    |         +     . Versicolor     X       |   D
   I  1 +          +    X Virginica              + 1 I
   M    |         +++                  X         |   M
   E    |          +             .   X XX        |   E
   N    |         +++          ..  XXXXX X       |   N
   S    |       + ++           ....XXX    X      |   S
   I  0 +         +++        .... XXXX           + 0 I
   O    |         ++       . ....XXXX            |   O
   N    |        ++        ..... XX              |   N
        |       + +        .....XXX              |
   2    |                .  ..   X               |   2
     -1 +         +      .                       + 1
        |                 .   X                  |
        |                                        |
        +-+--------+--------+--------+--------+--+
        -5.0     -2.5      0.0      2.5      5.0
                       Dimension 1


/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

libname workx "d:/wpswrkx"; /*---place in autoexec ---*/

proc datasets lib=workx kill;
run;

options validvarname=v7;
data workx.iris;
 retain Sepal_Length Sepal_Width Petal_Length Petal_Width Species ;
 informat Species $11.;
 input
 Sepal_Length Sepal_Width Petal_Length Petal_Width Species @@;
cards4;
5.1 3.5 1.4 0.2 setosa 7.0 3.2 4.7 1.4 versicolor 6.3 3.3 6.0 2.5 virginica
4.9 3.0 1.4 0.2 setosa 6.4 3.2 4.5 1.5 versicolor 5.8 2.7 5.1 1.9 virginica
4.7 3.2 1.3 0.2 setosa 6.9 3.1 4.9 1.5 versicolor 7.1 3.0 5.9 2.1 virginica
4.6 3.1 1.5 0.2 setosa 5.5 2.3 4.0 1.3 versicolor 6.3 2.9 5.6 1.8 virginica
5.0 3.6 1.4 0.2 setosa 6.5 2.8 4.6 1.5 versicolor 6.5 3.0 5.8 2.2 virginica
5.4 3.9 1.7 0.4 setosa 5.7 2.8 4.5 1.3 versicolor 7.6 3.0 6.6 2.1 virginica
4.6 3.4 1.4 0.3 setosa 6.3 3.3 4.7 1.6 versicolor 4.9 2.5 4.5 1.7 virginica
5.0 3.4 1.5 0.2 setosa 4.9 2.4 3.3 1.0 versicolor 7.3 2.9 6.3 1.8 virginica
4.4 2.9 1.4 0.2 setosa 6.6 2.9 4.6 1.3 versicolor 6.7 2.5 5.8 1.8 virginica
4.9 3.1 1.5 0.1 setosa 5.2 2.7 3.9 1.4 versicolor 7.2 3.6 6.1 2.5 virginica
5.4 3.7 1.5 0.2 setosa 5.0 2.0 3.5 1.0 versicolor 6.5 3.2 5.1 2.0 virginica
4.8 3.4 1.6 0.2 setosa 5.9 3.0 4.2 1.5 versicolor 6.4 2.7 5.3 1.9 virginica
4.8 3.0 1.4 0.1 setosa 6.0 2.2 4.0 1.0 versicolor 6.8 3.0 5.5 2.1 virginica
4.3 3.0 1.1 0.1 setosa 6.1 2.9 4.7 1.4 versicolor 5.7 2.5 5.0 2.0 virginica
5.8 4.0 1.2 0.2 setosa 5.6 2.9 3.6 1.3 versicolor 5.8 2.8 5.1 2.4 virginica
5.7 4.4 1.5 0.4 setosa 6.7 3.1 4.4 1.4 versicolor 6.4 3.2 5.3 2.3 virginica
5.4 3.9 1.3 0.4 setosa 5.6 3.0 4.5 1.5 versicolor 6.5 3.0 5.5 1.8 virginica
5.1 3.5 1.4 0.3 setosa 5.8 2.7 4.1 1.0 versicolor 7.7 3.8 6.7 2.2 virginica
5.7 3.8 1.7 0.3 setosa 6.2 2.2 4.5 1.5 versicolor 7.7 2.6 6.9 2.3 virginica
5.1 3.8 1.5 0.3 setosa 5.6 2.5 3.9 1.1 versicolor 6.0 2.2 5.0 1.5 virginica
5.4 3.4 1.7 0.2 setosa 5.9 3.2 4.8 1.8 versicolor 6.9 3.2 5.7 2.3 virginica
5.1 3.7 1.5 0.4 setosa 6.1 2.8 4.0 1.3 versicolor 5.6 2.8 4.9 2.0 virginica
4.6 3.6 1.0 0.2 setosa 6.3 2.5 4.9 1.5 versicolor 7.7 2.8 6.7 2.0 virginica
5.1 3.3 1.7 0.5 setosa 6.1 2.8 4.7 1.2 versicolor 6.3 2.7 4.9 1.8 virginica
4.8 3.4 1.9 0.2 setosa 6.4 2.9 4.3 1.3 versicolor 6.7 3.3 5.7 2.1 virginica
5.0 3.0 1.6 0.2 setosa 6.6 3.0 4.4 1.4 versicolor 7.2 3.2 6.0 1.8 virginica
5.0 3.4 1.6 0.4 setosa 6.8 2.8 4.8 1.4 versicolor 6.2 2.8 4.8 1.8 virginica
5.2 3.5 1.5 0.2 setosa 6.7 3.0 5.0 1.7 versicolor 6.1 3.0 4.9 1.8 virginica
5.2 3.4 1.4 0.2 setosa 6.0 2.9 4.5 1.5 versicolor 6.4 2.8 5.6 2.1 virginica
4.7 3.2 1.6 0.2 setosa 5.7 2.6 3.5 1.0 versicolor 7.2 3.0 5.8 1.6 virginica
4.8 3.1 1.6 0.2 setosa 5.5 2.4 3.8 1.1 versicolor 7.4 2.8 6.1 1.9 virginica
5.4 3.4 1.5 0.4 setosa 5.5 2.4 3.7 1.0 versicolor 7.9 3.8 6.4 2.0 virginica
5.2 4.1 1.5 0.1 setosa 5.8 2.7 3.9 1.2 versicolor 6.4 2.8 5.6 2.2 virginica
5.5 4.2 1.4 0.2 setosa 6.0 2.7 5.1 1.6 versicolor 6.3 2.8 5.1 1.5 virginica
4.9 3.1 1.5 0.2 setosa 5.4 3.0 4.5 1.5 versicolor 6.1 2.6 5.6 1.4 virginica
5.0 3.2 1.2 0.2 setosa 6.0 3.4 4.5 1.6 versicolor 7.7 3.0 6.1 2.3 virginica
5.5 3.5 1.3 0.2 setosa 6.7 3.1 4.7 1.5 versicolor 6.3 3.4 5.6 2.4 virginica
4.9 3.6 1.4 0.1 setosa 6.3 2.3 4.4 1.3 versicolor 6.4 3.1 5.5 1.8 virginica
4.4 3.0 1.3 0.2 setosa 5.6 3.0 4.1 1.3 versicolor 6.0 3.0 4.8 1.8 virginica
5.1 3.4 1.5 0.2 setosa 5.5 2.5 4.0 1.3 versicolor 6.9 3.1 5.4 2.1 virginica
5.0 3.5 1.3 0.3 setosa 5.5 2.6 4.4 1.2 versicolor 6.7 3.1 5.6 2.4 virginica
4.5 2.3 1.3 0.3 setosa 6.1 3.0 4.6 1.4 versicolor 6.9 3.1 5.1 2.3 virginica
4.4 3.2 1.3 0.2 setosa 5.8 2.6 4.0 1.2 versicolor 5.8 2.7 5.1 1.9 virginica
5.0 3.5 1.6 0.6 setosa 5.0 2.3 3.3 1.0 versicolor 6.8 3.2 5.9 2.3 virginica
5.1 3.8 1.9 0.4 setosa 5.6 2.7 4.2 1.3 versicolor 6.7 3.3 5.7 2.5 virginica
4.8 3.0 1.4 0.3 setosa 5.7 3.0 4.2 1.2 versicolor 6.7 3.0 5.2 2.3 virginica
5.1 3.8 1.6 0.2 setosa 5.7 2.9 4.2 1.3 versicolor 6.3 2.5 5.0 1.9 virginica
4.6 3.2 1.4 0.2 setosa 6.2 2.9 4.3 1.3 versicolor 6.5 3.0 5.2 2.0 virginica
5.3 3.7 1.5 0.2 setosa 5.1 2.5 3.0 1.1 versicolor 6.2 3.4 5.4 2.3 virginica
5.0 3.3 1.4 0.2 setosa 5.7 2.8 4.1 1.3 versicolor 5.9 3.0 5.1 1.8 virginica
;;;;
run;

proc sort data=workx.iris;
 by species;
run;


/**************************************************************************************************************************/
/*  WORKX.IRIS total obs=150                                                                                              */
/*        species_    sepal_    sepal_    petal_    petal_                                                                */
/* Obs      name      length     width    length     width    species                                                     */
/*                                                                                                                        */
/*   1     setosa       5.1       3.5       1.4       0.2        0                                                        */
/*   2     setosa       4.9       3.0       1.4       0.2        0                                                        */
/*   3     setosa       4.7       3.2       1.3       0.2        0                                                        */
/*   4     setosa       4.6       3.1       1.5       0.2        0                                                        */
/*   5     setosa       5.0       3.6       1.4       0.2        0                                                        */
/* ...                                                                                                                    */
/* 146     virginica    6.7       3.0       5.2       2.3        2                                                        */
/* 147     virginica    6.3       2.5       5.0       1.9        2                                                        */
/* 148     virginica    6.5       3.0       5.2       2.0        2                                                        */
/* 149     virginica    6.2       3.4       5.4       2.3        2                                                        */
/* 150     virginica    5.9       3.0       5.1       1.8        2                                                        */
/**************************************************************************************************************************/

/*                   _     _
(_)_ __  _ __  _   _| |_  | | ___   __ _
| | `_ \| `_ \| | | | __| | |/ _ \ / _` |
| | | | | |_) | |_| | |_  | | (_) | (_| |
|_|_| |_| .__/ \__,_|\__| |_|\___/ \__, |
        |_|                        |___/
*/

libname workx "d:/wpswrkx"; /*---place in autoexec ---*/

proc datasets lib=workx kill;
run;

options validvarname=v7;
data workx.iris;
 retain Sepal_Length Sepal_Width Petal_Length Petal_Width Species ;
 informat Species $11.;
 input
 Sepal_Length Sepal_Width Petal_Length Petal_Width Species @@;
cards4;
5.1 3.5 1.4 0.2 setosa 7.0 3.2 4.7 1.4 versicolor 6.3 3.3 6.0 2.5 virginica
4.9 3.0 1.4 0.2 setosa 6.4 3.2 4.5 1.5 versicolor 5.8 2.7 5.1 1.9 virginica
4.7 3.2 1.3 0.2 setosa 6.9 3.1 4.9 1.5 versicolor 7.1 3.0 5.9 2.1 virginica
...
4.6 3.2 1.4 0.2 setosa 6.2 2.9 4.3 1.3 versicolor 6.5 3.0 5.2 2.0 virginica
5.3 3.7 1.5 0.2 setosa 5.1 2.5 3.0 1.1 versicolor 6.2 3.4 5.4 2.3 virginica
5.0 3.3 1.4 0.2 setosa 5.7 2.8 4.1 1.3 versicolor 5.9 3.0 5.1 1.8 virginica
;;;;
run;

proc sort data=workx.iris;
 by species;
run;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


%utlfkil(d:/png/mediods.png);
%utlfkil(d:/png/silhouette.png);

options set=RHOME "C:\Progra~1\R\R-4.5.2\bin\r";
proc r;
export data=workx.iris r=iris;
submit;
library(factoextra)
library(cluster)
# data(iris)
iris_numeric <- iris[, 1:4]  # Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
set.seed(123)
pam_result <- pam(iris_numeric, k = 3)

# Key outputs
table(pam_result$cluster)     # Cluster sizes: typically ~50 each

"pam_result$medoids"            # Indices of 3 medoid observations
pam_result$medoids            # Indices of 3 medoid observations

medoids_df <- as.data.frame(pam_result$medoids)

png("d:/png/silhouette.png")
sil <- silhouette(pam_result$cluster, daisy(iris_numeric))
plot(sil)
dev.off()

summary(sil)  # Average width ~0.55 (good)

png("d:/png/mediods.png")
fviz_cluster(pam_result, data = iris_numeric, geom = "point",
             main = "PAM K-Medoids on Iris")
dev.off()

confusion <- table(pam_result$cluster, iris$Species)
confusion_df <- as.data.frame.matrix(confusion)

confusion_df

endsubmit;
import r=confusion_df data=workx.confusion;
import r=medoids_df data=workx.madiods;
run;

A medoid is the "most central" actual data point in a cluster, making it more interpretable and robust than a calculated mean.

Sum of distances from this point to all other points in the cluster


/**************************************************************************************************************************/
/*   SLC                                                                                                                  */
/*                                                                                                                        */
/*  WORKX.CONFUSION total obs=3                                                                                           */
/*                                                                                                                        */
/*   SETOSA    VERSICOLOR    VIRGINICA                                                                                    */
/*                                                                                                                        */
/*     50           0             0                                                                                       */
/*      0          48            14                                                                                       */
/*      0           2            36                                                                                       */
/*                                                                                                                        */
/*                                                                                                                        */
/* HERE ARE THE FOUR DIMENSIOAL MEDOIDS                                                                                   */
/*                                                                                                                        */
/* WORKX.MADIODS total obs=3                                                                                              */
/*                                                                                                                        */
/*          SEPAL_     SEPAL_    PETAL_    PETAL_                                                                         */
/* CLUSTER  LENGTH     WIDTH    LENGTH     WIDTH                                                                          */
/*                                                                                                                        */
/*  1         5.0       3.4       1.5       0.2                                                                           */
/*  2         6.0       2.9       4.5       1.5                                                                           */
/*  3         6.8       3.0       5.5       2.1                                                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC         14:02 Tuesday, March 24, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx

NOTE: Library slchelp assigned as follows:
      Engine:        WPD
      Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp

NOTE: Library worksas assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\worksas

NOTE: Library workwpd assigned as follows:
      Engine:        WPD
      Physical Name: d:\workwpd


LOG:  14:02:28
NOTE: 1 record was written to file PRINT

NOTE: The data step took :
      real time : 0.016
      cpu time  : 0.015


NOTE: AUTOEXEC processing completed

1         %utlfkil(d:/png/mediods.png);
2         %utlfkil(d:/png/silhouette.png);
3
4         options set=RHOME "C:\Progra~1\R\R-4.5.2\bin\r";
5         proc r;
NOTE: Using R version 4.5.2 (2025-10-31 ucrt) from C:\Program Files\R\R-4.5.2
6         export data=workx.iris r=iris;
NOTE: Creating R data frame 'iris' from data set 'WORKX.iris'

7         submit;
8         library(factoextra)
9         library(cluster)
10        # data(iris)
11        iris_numeric <- iris[, 1:4]  # Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
12        set.seed(123)
13        pam_result <- pam(iris_numeric, k = 3)
14
15        # Key outputs
16        table(pam_result$cluster)     # Cluster sizes: typically ~50 each
17
18        "pam_result$medoids"            # Indices of 3 medoid observations
19        pam_result$medoids            # Indices of 3 medoid observations
20
21        str(pam_result$medoids)
22
23        medoids_df <- as.data.frame(pam_result$medoids)
24
25        png("d:/png/silhouette.png")
26        sil <- silhouette(pam_result$cluster, daisy(iris_numeric))
27        plot(sil)
28        dev.off()
29
30        summary(sil)  # Average width ~0.55 (good)
31
32        png("d:/png/mediods.png")
33        fviz_cluster(pam_result, data = iris_numeric, geom = "point",
34                     main = "PAM K-Medoids on Iris")
35        dev.off()
36
37        confusion <- table(pam_result$cluster, iris$Species)
38        confusion_df <- as.data.frame.matrix(confusion)
39
40        confusion_df
41
42        endsubmit;

NOTE: Submitting statements to R:

> library(factoextra)
Loading required package: ggplot2
Welcome to factoextra!
Want to learn more? See two factoextra-related books at https://www.datanovia.com/en/product/practical-guide-to-principal-component-methods-in-r/
Warning message:
package 'factoextra' was built under R version 4.5.3
> library(cluster)
Warning message:
package 'cluster' was built under R version 4.5.3
> # data(iris)
> iris_numeric <- iris[, 1:4]  # Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
> set.seed(123)
> pam_result <- pam(iris_numeric, k = 3)
>
> # Key outputs
> table(pam_result$cluster)     # Cluster sizes: typically ~50 each
>
> "pam_result$medoids"            # Indices of 3 medoid observations
> pam_result$medoids            # Indices of 3 medoid observations
>
> str(pam_result$medoids)
>
> medoids_df <- as.data.frame(pam_result$medoids)
>
> png("d:/png/silhouette.png")
> sil <- silhouette(pam_result$cluster, daisy(iris_numeric))
> plot(sil)
> dev.off()
>
> summary(sil)  # Average width ~0.55 (good)
>
> png("d:/png/mediods.png")
> fviz_cluster(pam_result, data = iris_numeric, geom = "point",
+              main = "PAM K-Medoids on Iris")
> dev.off()
>
> confusion <- table(pam_result$cluster, iris$Species)
> confusion_df <- as.data.frame.matrix(confusion)
>
> confusion_df
>

NOTE: Processing of R statements complete

43        import r=confusion_df data=workx.confusion;
NOTE: Creating data set 'WORKX.confusion' from R data frame 'confusion_df'
NOTE: Column names modified during import of 'confusion_df'
NOTE: Data set "WORKX.confusion" has 3 observation(s) and 3 variable(s)

44        import r=medoids_df data=workx.madiods;
NOTE: Creating data set 'WORKX.madiods' from R data frame 'medoids_df'
NOTE: Column names modified during import of 'medoids_df'
NOTE: Data set "WORKX.madiods" has 3 observation(s) and 4 variable(s)

45        run;
NOTE: Procedure r step took :
      real time : 2.704
      cpu time  : 0.015


ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 2.800
      cpu time  : 0.125

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
