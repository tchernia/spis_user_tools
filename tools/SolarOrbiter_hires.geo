/////////////////////////////////////////
// Solar Orbiter refined geometry
// S.Guillemant, ESA
// G.Deprez, ESA, gregoire.deprez@esa.int
/////////////////////////////////////////
// Changelog
// v1, 11/12/2019, G.Deprez, Latest version for Science data processing


// Definitions

PI=3.1415927;


l1h = 2.98;   /* hauteur du bouclier (en m)*/
l1L = 2.27;   /* largeur du bouclier (en m)*/
l1_Rh = 2.88;  /* hauteur = largeur de face arriere du bouclier*/
l1_Rl = 2.17;  /* hauteur = largeur de face arriere du bouclier*/
l2 = 0.31;    /* hauteur du bouclier */
l2_R = 0.31;  /* Epaisseur reelle du bouclier 0.29*/

l3h = 2.20;   /* hauteur bloc central (a verifier) */
l3L = 1.52;   /* largeur bloc central (a verifier) */
l3p = 1.92;    /* profondeur bloc central (a verifier) */

l4 = 6.26;    /*longueur des panneaux */
l5 = 1.26;     /* largeur des panneaux*/
e1 = 0.10;   /* epaisseur des panneaux (a verifier) */ //0.05
l6 = 1.94;    /*espacement entre les panneaux et le centre SC*/

l7 = 0.09;   /*distance bord arriere sat - mat antenne HGA*/
l7e = 0.12;  /*epaisseur mat antenne HGA*/
l7L = 1.40;   /*longueur mat antenne HGA*/
l7s = 0.2;    /*distance securite et epaisseur mat - antenne HGA*/
l8p = 0.223;  /*profondeur antenne HGA*/
l8r = 0.55;   /*rayon antenne HGA*/
l8Z = 0.76;   /*rayon de construction de l'antenne HGA*/
l9E = 0.46;   /*ecart debut mat - arriere sat*/
l9d = 0.512;  /*ecart bord sat - debut mat*/
l9D = 4.5;    /*distance Z debut mat - fin mat*/
l9r = 0.05;  /*rayon mat arriere*/ //0.025
d = 10;       /*Decalage du domaine de simulation*/
d_M = 2;      /*Decalage du domaine de maillage fin*/
l1R_x = 0.25;   /*Renfoncement X du coin bouclier avant*/
l1R_y = 0.25;   /*Renfoncement y du coin bouclier avant*/
l2R_x = 0.12;   /*Renfoncement X du coin bouclier arrière*/
l2R_y = 0.12;   /*Renfoncement y du coin bouclier arrière*/

/* Antennes */

laz = 0.99 ;         /* Decalage antennes dans la direction z*/
ra  = 0.025;        /* Rayon antennes */
lant= 6.50 ;       /* Long antennes 5.34*/
dda = 0.96;          /* Separtion de l'antenne du corps du sat. */
ang = -125*PI/180;  /* Angle des antennes +x et -x par rapport a l'axe y*/
lay = -l3h/2;       /* position  y  de la base des antennes +x et -x*/
lax =  l3L/2 + dda; /* position |x| de la base des antennes +x et -x */

/* Antennes RPW */

Rlant= 6.5   ;       /* Long antennes */
Rdda = 0.96;          /* Sépartion de l'antenne du support antennes */
Rang = -125*PI/180;  /* Angle des antennes +x et -x par rapport a l'axe y*/
Rlay = -l3h/2;       /* position  y  de la base des antennes +x et -x*/
Rlax =  l3L/2 + dda; /* position |x| de la base des antennes +x et -x */

/* Antenne HGA*/
ang_hga = 0*PI/180; /* Angle (rad) de rotation autour de l'axe y du plateau de l'antenne HGA (ang=0 --> vers le sillage, ang=90 --> vers -x ) */

// Mesh size

m1 = 0.15; /*taille des mailles sur le satellite - face avant*/ //25
m3 = 0.15;  /*taille des mailles sur le satellite - face arriere*/ //0.20
m5 = 0.20; /*taille des mailles sur l'antenne - face avant*/
m6 = 0.30; /*taille des mailles sur l'antenne - face arriere*/
m7 = 0.08; /*taille des mailles sur le RPW */
m8 = 0.08; /*taille des mailles sur le boom*/ //0.05
m71 = 0.20; /*taille des mailles sur boite sim RPW*/
m9 = 0.20; /*taille des mailles sur coin du heatshield*/ //0.05
m10 = 0.15; /*taille des mailles sur la boite de sim associée*/ //0.25

//  Definitions utiles
sa_hga = Sin(ang_hga);ca_hga = Cos(ang_hga); /* HGA: sin et cos de l'angle de rotation*/
sa     = Sin(ang)    ;ca     = Cos(ang);     /* Pour la matrice de rotation des antennes +x et -x */
lantx=lant*Fabs(sa);lanty=lant*ca;
/* HGA: Definition d'un point sur l'axe de rotation */
xc_hga=0;yc_hga=-l3h/2-l7L;zc_hga=-l2-l3p-l7+l7e/2;


//Solar array

Arraywidth = 1.200;
Arraylength = 6.320;
Arraythickness = 0.025;
Arrayres = 0.05;


HingeRes = 0.01;
Boomres = 0.05;
EASRes = 0.05;
Coneres = Boomres;
CylinderRes = Boomres;
Plateres = Boomres;
Yokeres = 0.025;

SCres = 0.20;
Stripres = 0.025;

segsep = 0.010;

braf = 1.8;

YokeOSRres = 0.08/4;

//SC bus (Group 10)

SCdim = 1.52;		//Spacecraft dimension

SCdimX = 1.91;
SCdimY = 1.52;
SCdimZ = 2.2;

SCrefx = -SCdimX/2;
SCrefy = SCdimY/2;
SCrefz = SCdimZ/2;

Cone_base_Ypos=-0.775;
Cone_base_Zpos=-1.095;
Cone_base_diamext=0.682;
Cone_height=0.292;
Cone_top_diamext=1.084;

//Sun shield (group 70)

ShieldBackHeight = 2.880;
ShieldBackWidth = 2.170;
ShieldFrontHeight = 3.060;
ShieldFrontWidth = 2.400;
ShieldBackThickness = 0.061;
ShieldFrontThickness = 0.01;
BaffleDimBack = 0.120;
BaffleDimFront = 0.250;
BaffleThickness = 0.030;
HeightDifference = ShieldFrontHeight - ShieldBackHeight;
WidthDifference = ShieldFrontWidth - ShieldBackWidth;
ShieldSep = 0.30;
PatchLength = 0.217;


ShieldRefX = SCrefx - SCdimX - segsep - ShieldBackThickness;
ShieldRefY = 0;
ShieldRefZ = 0;

/* Antennes RPW */

Rlant= 6.5   ;       /* Long antennes */
Rdda = 0.96;          /* Sépartion de l'antenne du support antennes */
Rang = -125*PI/180;  /* Angle des antennes +x et -x par rapport a l'axe y*/
Rlay = -l3h/2;       /* position  y  de la base des antennes +x et -x*/
Rlax =  l3L/2 + dda; /* position |x| de la base des antennes +x et -x */
m7 = 0.08; /*taille des mailles sur le RPW */
m71 = 0.20; /*taille des mailles sur boite sim RPW*/

//SC
Point(1001) = {SCrefx, SCrefy, SCrefz, SCres};
Point(1002) = {SCrefx, SCrefy - SCdimY, SCrefz, SCres};
Point(1003) = {SCrefx - SCdimX, SCrefy - SCdimY, SCrefz, SCres};
Point(1004) = {SCrefx - SCdimX, SCrefy, SCrefz, SCres};
Point(1005) = {SCrefx, SCrefy, SCrefz - SCdimZ, SCres};
Point(1006) = {SCrefx, SCrefy - SCdimY, SCrefz - SCdimZ, SCres};
Point(1007) = {SCrefx - SCdimX, SCrefy - SCdimY, SCrefz - SCdimZ, SCres};

Point(1008) = {SCrefx - SCdimX, SCrefy, SCrefz - SCdimZ, SCres};

//SC end

//Xp cone
Point(1009) = {SCrefx, SCrefy+Cone_base_Ypos, SCrefz+Cone_base_Zpos, SCres};
Point(1010) = {SCrefx, SCrefy+Cone_base_Ypos, SCrefz+Cone_base_Zpos+Cone_base_diamext/2, SCres};
Point(1011) = {SCrefx, SCrefy+Cone_base_Ypos+Cone_base_diamext/2, SCrefz+Cone_base_Zpos, SCres};
Point(1012) = {SCrefx, SCrefy+Cone_base_Ypos, SCrefz+Cone_base_Zpos-Cone_base_diamext/2, SCres};
Point(1013) = {SCrefx, SCrefy+Cone_base_Ypos-Cone_base_diamext/2, SCrefz+Cone_base_Zpos, SCres};

Point(1014) = {SCrefx+Cone_height, SCrefy+Cone_base_Ypos, SCrefz+Cone_base_Zpos, SCres};
Point(1015) = {SCrefx+Cone_height, SCrefy+Cone_base_Ypos, SCrefz+Cone_base_Zpos+Cone_top_diamext/2, SCres};
Point(1016) = {SCrefx+Cone_height, SCrefy+Cone_base_Ypos+Cone_top_diamext/2, SCrefz+Cone_base_Zpos, SCres};
Point(1017) = {SCrefx+Cone_height, SCrefy+Cone_base_Ypos, SCrefz+Cone_base_Zpos-Cone_top_diamext/2, SCres};
Point(1018) = {SCrefx+Cone_height, SCrefy+Cone_base_Ypos-Cone_top_diamext/2, SCrefz+Cone_base_Zpos, SCres};

Circle(1021) = {1010,1009,1011};
Circle(1022) = {1011,1009,1012};
Circle(1023) = {1012,1009,1013};
Circle(1024) = {1013,1009,1010};

Circle(1025) = {1015,1014,1016};
Circle(1026) = {1016,1014,1017};
Circle(1027) = {1017,1014,1018};
Circle(1028) = {1018,1014,1015};

Line(1029) = {1010, 1015};
Line(1030) = {1011, 1016};
Line(1031) = {1012, 1017};
Line(1032) = {1013, 1018};

Line Loop(1027) = {1021, 1022, 1023, 1024};
Line Loop(1028) = {1025, 1026, 1027, 1028};

Line Loop(1029) = {1025, -1030, -1021, 1029};
Line Loop(1030) = {1026, -1031, -1022, 1030};
Line Loop(1031) = {1027, -1032, -1023, 1031};
Line Loop(1032) = {1028, -1029, -1024, 1032};

Plane Surface(1033) = {1028};
Ruled Surface(1034) = {1029};
Ruled Surface(1035) = {1030};
Ruled Surface(1036) = {1031};
Ruled Surface(1037) = {1032};
//Xp cone end

//Yp top left extrusion
SC_Yp_1_Xpos = 0;
SC_Yp_1_Zpos = -0.15;
SC_Yp_1_1X = 0.1;
SC_Yp_1_1Z = -0.05;
SC_Yp_1_2Z = -0.7;
SC_Yp_1_3X = 0.05;
SC_Yp_1_3Z = -0.05;
SC_Yp_1_4Z = -0.3;
SC_Yp_1_5X = -0.15;
SC_Yp_1_5Z = -0.15;

X=SCrefx+SC_Yp_1_Xpos;
Y=SCrefy;
Z=SCrefz+SC_Yp_1_Zpos;
Point(1019) = {X, Y, Z, SCres};
X=X+SC_Yp_1_1X;
Z=Z+SC_Yp_1_1Z;
Point(1020) = {X, Y, Z, SCres};
Z=Z+SC_Yp_1_2Z;
Point(1021) = {X, Y, Z, SCres};
X=X+SC_Yp_1_3X;
Z=Z+SC_Yp_1_3Z;
Point(1022) = {X, Y, Z, SCres};
Z=Z+SC_Yp_1_4Z;
Point(1023) = {X, Y, Z, SCres};
X=X+SC_Yp_1_5X;
Z=Z+SC_Yp_1_5Z;
Point(1024) = {X, Y, Z, SCres};

X=SCrefx+SC_Yp_1_Xpos;
Y=SCrefy-0.1;
Z=SCrefz+SC_Yp_1_Zpos;
Point(1025) = {X, Y, Z, SCres};
X=X+SC_Yp_1_1X;
Z=Z+SC_Yp_1_1Z;
Point(1026) = {X, Y, Z, SCres};
Z=Z+SC_Yp_1_2Z;
Point(1027) = {X, Y, Z, SCres};
X=X+SC_Yp_1_3X;
Z=Z+SC_Yp_1_3Z;
Point(1028) = {X, Y, Z, SCres};
Z=Z+SC_Yp_1_4Z;
Point(1029) = {X, Y, Z, SCres};
X=X+SC_Yp_1_5X;
Z=Z+SC_Yp_1_5Z;
Point(1030) = {X, Y, Z, SCres};
//Yp top left extrusion end

//Ym top right extrusion
SC_Ym_1_Xpos = 0;
SC_Ym_1_Zpos = -0.8;
SC_Ym_1_1X = 0.15;
SC_Ym_1_1Z = -0.15;
SC_Ym_1_2Z = -0.3;
SC_Ym_1_3X = -0.15;
SC_Ym_1_3Z = -0.15;

X=SCrefx+SC_Ym_1_Xpos;
Y=SCrefy-SCdimY;
Z=SCrefz+SC_Ym_1_Zpos;
Point(1040) = {X, Y, Z, SCres};
X=X+SC_Ym_1_1X;
Z=Z+SC_Ym_1_1Z;
Point(1041) = {X, Y, Z, SCres};
Z=Z+SC_Ym_1_2Z;
Point(1042) = {X, Y, Z, SCres};
X=X+SC_Ym_1_3X;
Z=Z+SC_Ym_1_3Z;
Point(1043) = {X, Y, Z, SCres};

X=SCrefx+SC_Ym_1_Xpos;
Y=SCrefy-SCdimY+0.1;
Z=SCrefz+SC_Ym_1_Zpos;
Point(1044) = {X, Y, Z, SCres};
X=X+SC_Ym_1_1X;
Z=Z+SC_Ym_1_1Z;
Point(1045) = {X, Y, Z, SCres};
Z=Z+SC_Ym_1_2Z;
Point(1046) = {X, Y, Z, SCres};
X=X+SC_Ym_1_3X;
Z=Z+SC_Ym_1_3Z;
Point(1047) = {X, Y, Z, SCres};
//Ym top right extrusion end

Line(1009) = {1001, 1002};
Line(1010) = {1002, 1003};
Line(1011) = {1003, 1004};
Line(1012) = {1004, 1001};
Line(1013) = {1001, 1019};
Line(1014) = {1002, 1040};
Line(1015) = {1003, 1007};
Line(1016) = {1004, 1008};
Line(1017) = {1005, 1006};
Line(1018) = {1006, 1007};
Line(1019) = {1007, 1008};
Line(1020) = {1008, 1005};


Line(1033) = {1019, 1020};
Line(1034) = {1020, 1021};
Line(1035) = {1021, 1022};
Line(1036) = {1022, 1023};
Line(1037) = {1023, 1024};
Line(1038) = {1024, 1005};

Line(1039) = {1025, 1026};
Line(1040) = {1026, 1027};
Line(1041) = {1027, 1028};
Line(1042) = {1028, 1029};
Line(1043) = {1029, 1030};
Line(1044) = {1030, 1025};

Line(1045) = {1019, 1025};
Line(1046) = {1020, 1026};
Line(1047) = {1021, 1027};
Line(1048) = {1022, 1028};
Line(1049) = {1023, 1029};
Line(1050) = {1024, 1030};

Line(1060) = {1040, 1041};
Line(1061) = {1041, 1042};
Line(1062) = {1042, 1043};
Line(1063) = {1043, 1006};

Line(1064) = {1044, 1045};
Line(1065) = {1045, 1046};
Line(1066) = {1046, 1047};

Line(1067) = {1040, 1044};
Line(1068) = {1041, 1045};
Line(1069) = {1042, 1046};
Line(1070) = {1043, 1047};

Line(1071) = {1044, 1047};


Line Loop(1021) = {1009, 1010, 1011, 1012};
Line Loop(1022) = {1013, 1045, -1044, -1050, 1038, 1017, -1063, 1070, -1071, -1067, -1014, -1009};
Line Loop(1023) = {1014, 1060, 1061, 1062, 1063, 1018, -1015, -1010};
Line Loop(1024) = {1015, 1019, -1016, -1011};
Line Loop(1025) = {1016, 1020, -1038, -1037, -1036, -1035, -1034, -1033, -1013, -1012};
Line Loop(1026) = {1017, 1018, 1019, 1020};

Line Loop(1033) = {1033, 1046, -1039, -1045};
Line Loop(1034) = {1034, 1047, -1040, -1046};
Line Loop(1035) = {1035, 1048, -1041, -1047};
Line Loop(1036) = {1036, 1049, -1042, -1048};
Line Loop(1037) = {1037, 1050, -1043, -1049};
Line Loop(1038) = {1039, 1040, 1041, 1042, 1043, 1044};

Line Loop(1040) = {1060, 1068, -1064, -1067};
Line Loop(1041) = {1061, 1069, -1065, -1068};
Line Loop(1042) = {1062, 1070, -1066, -1069};
Line Loop(1043) = {1064, 1065, 1066, -1071};

Plane Surface(1039) = {1033};
Plane Surface(1040) = {1034};
Plane Surface(1041) = {1035};
Plane Surface(1042) = {1036};
Plane Surface(1043) = {1037};
Plane Surface(1044) = {1038};
Plane Surface(1045) = {1040};
Plane Surface(1046) = {1041};
Plane Surface(1047) = {1042};
Plane Surface(1048) = {1043};

//Yoke general parameters

segsep = 0.010;
Scsep = 0.1;				//separation from S/C bus

SCsep = Scsep - segsep;

Shieldwidth = 0.100;
Yokeconn = SCdimZ/2;
Yokesep = 0.015;			//Half of the separation between up and down parts of the yoke
Yokewidth = 0.01;
Beamwidth = 0.036;			//Width of the yoke beam

Yoketotallength = 1.847;

OSRwidth=0.08;

//Yoke segment 1, +Y, +Z (Group 11)

Yokelength11 = (ShieldFrontWidth/2)-SCrefy-OSRwidth-segsep-segsep;

Ys11refx = SCrefx;
Ys11refy = SCrefy + segsep + Yokelength11;
Ys11refz = SCrefz - Yokeconn + Yokesep + Shieldwidth;


Point(1101) = {Ys11refx, Ys11refy, Ys11refz, Yokeres};
Point(1102) = {Ys11refx, Ys11refy - Yokelength11 + SCsep, Ys11refz, Yokeres};
Point(1103) = {Ys11refx - Beamwidth, Ys11refy - Yokelength11 + SCsep, Ys11refz, Yokeres};
Point(1104) = {Ys11refx - Beamwidth, Ys11refy, Ys11refz, Yokeres};
Point(1105) = {Ys11refx, Ys11refy, Ys11refz - Shieldwidth + Beamwidth, Yokeres};
Point(1106) = {Ys11refx, Ys11refy - Yokelength11 + SCsep, Ys11refz - Shieldwidth + Beamwidth, Yokeres};
Point(1107) = {Ys11refx - Yokewidth, Ys11refy - Yokelength11 + SCsep, Ys11refz - Shieldwidth + Beamwidth, Yokeres};
Point(1108) = {Ys11refx - Yokewidth, Ys11refy, Ys11refz - Shieldwidth + Beamwidth, Yokeres};
Point(1109) = {Ys11refx, Ys11refy, Ys11refz - Shieldwidth, Yokeres};
Point(1110) = {Ys11refx, Ys11refy - Yokelength11 + SCsep, Ys11refz - Shieldwidth, Yokeres};
Point(1111) = {Ys11refx - Beamwidth, Ys11refy - Yokelength11 + SCsep, Ys11refz - Shieldwidth*0.64, Yokeres};
Point(1112) = {Ys11refx - Beamwidth, Ys11refy, Ys11refz - Shieldwidth*0.64, Yokeres};

Line(1113) = {1101, 1102};
Line(1114) = {1102, 1103};
Line(1115) = {1103, 1104};
Line(1116) = {1104, 1101};
Line(1117) = {1105, 1106};
Line(1118) = {1106, 1107};
Line(1119) = {1107, 1108};
Line(1120) = {1108, 1105};
Line(1121) = {1109, 1110};
Line(1122) = {1110, 1111};
Line(1123) = {1111, 1112};
Line(1124) = {1112, 1109};
Line(1125) = {1101, 1108};
Line(1126) = {1105, 1109};
Line(1127) = {1102, 1107};
Line(1128) = {1106, 1110};
Line(1129) = {1103, 1111};
Line(1130) = {1104, 1112};

Line Loop(1131) = {1113, 1114, 1115, 1116};
Line Loop(1132) = {1117, 1118, 1119, 1120};
Line Loop(1133) = {1121, 1122, 1123, 1124};
Line Loop(1134) = {-1119, -1127, -1113, 1125};
Line Loop(1135) = {1121, -1128, -1117, 1126};
Line Loop(1136) = {-1123, -1129, 1115, 1130};
Line Loop(1137) = {1125, 1120, 1126, -1124, -1130, 1116};
Line Loop(1138) = {1127, -1118, 1128, 1122, -1129, -1114};

Plane Surface(1139) = {1131};
Plane Surface(1140) = {1132};
Plane Surface(1141) = {1133};
Plane Surface(1142) = {1134};
Plane Surface(1143) = {1135};
Plane Surface(1144) = {1136};
Plane Surface(1145) = {1137};
Plane Surface(1146) = {1138};

Surface Loop(11) = {1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146};




//Yoke segment 2, +Y, +Z (Group 12)

Yokelength12 = OSRwidth;

Ys12refx = SCrefx;
Ys12refy = SCrefy + segsep + Yokelength11 + segsep + Yokelength12;
Ys12refz = SCrefz - Yokeconn + Yokesep + Shieldwidth;



Point(1201) = {Ys12refx, Ys12refy, Ys12refz, Yokeres};
Point(1202) = {Ys12refx, Ys12refy - Yokelength12, Ys12refz, Yokeres};
Point(1203) = {Ys12refx - Beamwidth, Ys12refy - Yokelength12, Ys12refz, YokeOSRres};
Point(1204) = {Ys12refx - Beamwidth, Ys12refy, Ys12refz, YokeOSRres};
Point(1205) = {Ys12refx, Ys12refy, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1206) = {Ys12refx, Ys12refy - Yokelength12, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1207) = {Ys12refx - Yokewidth, Ys12refy - Yokelength12, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1208) = {Ys12refx - Yokewidth, Ys12refy, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1209) = {Ys12refx, Ys12refy, Ys12refz - Shieldwidth, Yokeres};
Point(1210) = {Ys12refx, Ys12refy - Yokelength12, Ys12refz - Shieldwidth, Yokeres};
Point(1211) = {Ys12refx - Beamwidth, Ys12refy - Yokelength12, Ys12refz - Shieldwidth*0.64, YokeOSRres};
Point(1212) = {Ys12refx - Beamwidth, Ys12refy, Ys12refz - Shieldwidth*0.64, YokeOSRres};

Line(1213) = {1201, 1202};
Line(1214) = {1202, 1203};
Line(1215) = {1203, 1204};
Line(1216) = {1204, 1201};
Line(1217) = {1205, 1206};
Line(1218) = {1206, 1207};
Line(1219) = {1207, 1208};
Line(1220) = {1208, 1205};
Line(1221) = {1209, 1210};
Line(1222) = {1210, 1211};
Line(1223) = {1211, 1212};
Line(1224) = {1212, 1209};
Line(1225) = {1201, 1208};
Line(1226) = {1205, 1209};
Line(1227) = {1202, 1207};
Line(1228) = {1206, 1210};
Line(1229) = {1203, 1211};
Line(1230) = {1204, 1212};

Line Loop(1231) = {1213, 1214, 1215, 1216};
Line Loop(1232) = {1217, 1218, 1219, 1220};
Line Loop(1233) = {1221, 1222, 1223, 1224};
Line Loop(1234) = {-1219, -1227, -1213, 1225};
Line Loop(1235) = {1221, -1228, -1217, 1226};
Line Loop(1236) = {-1223, -1229, 1215, 1230};
Line Loop(1237) = {1225, 1220, 1226, -1224, -1230, 1216};
Line Loop(1238) = {1227, -1218, 1228, 1222, -1229, -1214};

Plane Surface(1239) = {1231};
Plane Surface(1240) = {1232};
Plane Surface(1241) = {1233};
Plane Surface(1242) = {1234};
Plane Surface(1243) = {1235};
Plane Surface(1244) = {1236};
Plane Surface(1245) = {1237};
Plane Surface(1246) = {1238};


Surface Loop(12) = {1239, 1240, 1241, 1242, 1243, 1244, 1245, 1246};



//Yoke segment 1, +Y, -Z (Group 17)

Yokelength17 = Yokelength11;

Ys17refx = SCrefx;
Ys17refy = SCrefy + segsep + Yokelength17;
Ys17refz = SCrefz - Yokeconn - Yokesep;



Point(1701) = {Ys17refx, Ys17refy, Ys17refz, Yokeres};
Point(1702) = {Ys17refx, Ys17refy - Yokelength17 + SCsep, Ys17refz, Yokeres};
Point(1703) = {Ys17refx - Beamwidth, Ys17refy - Yokelength17 + SCsep, Ys17refz, Yokeres};
Point(1704) = {Ys17refx - Beamwidth, Ys17refy, Ys17refz, Yokeres};
Point(1705) = {Ys17refx, Ys17refy, Ys17refz - Shieldwidth + Beamwidth, Yokeres};
Point(1706) = {Ys17refx, Ys17refy - Yokelength17 + SCsep, Ys17refz - Shieldwidth + Beamwidth, Yokeres};
Point(1707) = {Ys17refx - Yokewidth, Ys17refy - Yokelength17 + SCsep, Ys17refz - Shieldwidth + Beamwidth, Yokeres};
Point(1708) = {Ys17refx - Yokewidth, Ys17refy, Ys17refz - Shieldwidth + Beamwidth, Yokeres};
Point(1709) = {Ys17refx, Ys17refy, Ys17refz - Shieldwidth, Yokeres};
Point(1710) = {Ys17refx, Ys17refy - Yokelength17 + SCsep, Ys17refz - Shieldwidth, Yokeres};
Point(1711) = {Ys17refx - Beamwidth, Ys17refy - Yokelength17 + SCsep, Ys17refz - Shieldwidth*0.64, Yokeres};
Point(1712) = {Ys17refx - Beamwidth, Ys17refy, Ys17refz - Shieldwidth*0.64, Yokeres};

Line(1713) = {1701, 1702};
Line(1714) = {1702, 1703};
Line(1715) = {1703, 1704};
Line(1716) = {1704, 1701};
Line(1717) = {1705, 1706};
Line(1718) = {1706, 1707};
Line(1719) = {1707, 1708};
Line(1720) = {1708, 1705};
Line(1721) = {1709, 1710};
Line(1722) = {1710, 1711};
Line(1723) = {1711, 1712};
Line(1724) = {1712, 1709};
Line(1725) = {1701, 1708};
Line(1726) = {1705, 1709};
Line(1727) = {1702, 1707};
Line(1728) = {1706, 1710};
Line(1729) = {1703, 1711};
Line(1730) = {1704, 1712};

Line Loop(1731) = {1713, 1714, 1715, 1716};
Line Loop(1732) = {1717, 1718, 1719, 1720};
Line Loop(1733) = {1721, 1722, 1723, 1724};
Line Loop(1734) = {-1719, -1727, -1713, 1725};
Line Loop(1735) = {1721, -1728, -1717, 1726};
Line Loop(1736) = {-1723, -1729, 1715, 1730};
Line Loop(1737) = {1725, 1720, 1726, -1724, -1730, 1716};
Line Loop(1738) = {1727, -1718, 1728, 1722, -1729, -1714};

Plane Surface(1739) = {1731};
Plane Surface(1740) = {1732};
Plane Surface(1741) = {1733};
Plane Surface(1742) = {1734};
Plane Surface(1743) = {1735};
Plane Surface(1744) = {1736};
Plane Surface(1745) = {1737};
Plane Surface(1746) = {1738};

Surface Loop(17) = {1739, 1740, 1741, 1742, 1743, 1744, 1745, 1746};




//Yoke segment 2, +Y, -Z (Group 16)

Yokelength16 = OSRwidth;

Ys16refx = SCrefx;
Ys16refy = SCrefy + segsep + Yokelength17 + segsep + Yokelength16;
Ys16refz = SCrefz - Yokeconn - Yokesep;



Point(1601) = {Ys16refx, Ys16refy, Ys16refz, Yokeres};
Point(1602) = {Ys16refx, Ys16refy - Yokelength16, Ys16refz, Yokeres};
Point(1603) = {Ys16refx - Beamwidth, Ys16refy - Yokelength16, Ys16refz, YokeOSRres};
Point(1604) = {Ys16refx - Beamwidth, Ys16refy, Ys16refz, YokeOSRres};
Point(1605) = {Ys16refx, Ys16refy, Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1606) = {Ys16refx, Ys16refy - Yokelength16, Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1607) = {Ys16refx - Yokewidth, Ys16refy - Yokelength16, Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1608) = {Ys16refx - Yokewidth, Ys16refy, Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1609) = {Ys16refx, Ys16refy, Ys16refz - Shieldwidth, Yokeres};
Point(1610) = {Ys16refx, Ys16refy - Yokelength16, Ys16refz - Shieldwidth, Yokeres};
Point(1611) = {Ys16refx - Beamwidth, Ys16refy - Yokelength16, Ys16refz - Shieldwidth*0.64, YokeOSRres};
Point(1612) = {Ys16refx - Beamwidth, Ys16refy, Ys16refz - Shieldwidth*0.64, YokeOSRres};

Line(1613) = {1601, 1602};
Line(1614) = {1602, 1603};
Line(1615) = {1603, 1604};
Line(1616) = {1604, 1601};
Line(1617) = {1605, 1606};
Line(1618) = {1606, 1607};
Line(1619) = {1607, 1608};
Line(1620) = {1608, 1605};
Line(1621) = {1609, 1610};
Line(1622) = {1610, 1611};
Line(1623) = {1611, 1612};
Line(1624) = {1612, 1609};
Line(1625) = {1601, 1608};
Line(1626) = {1605, 1609};
Line(1627) = {1602, 1607};
Line(1628) = {1606, 1610};
Line(1629) = {1603, 1611};
Line(1630) = {1604, 1612};

Line Loop(1631) = {1613, 1614, 1615, 1616};
Line Loop(1632) = {1617, 1618, 1619, 1620};
Line Loop(1633) = {1621, 1622, 1623, 1624};
Line Loop(1634) = {-1619, -1627, -1613, 1625};
Line Loop(1635) = {1621, -1628, -1617, 1626};
Line Loop(1636) = {-1623, -1629, 1615, 1630};
Line Loop(1637) = {1625, 1620, 1626, -1624, -1630, 1616};
Line Loop(1638) = {1627, -1618, 1628, 1622, -1629, -1614};

Plane Surface(1639) = {1631};
Plane Surface(1640) = {1632};
Plane Surface(1641) = {1633};
Plane Surface(1642) = {1634};
Plane Surface(1643) = {1635};
Plane Surface(1644) = {1636};
Plane Surface(1645) = {1637};
Plane Surface(1646) = {1638};

Surface Loop(16) = {1639, 1640, 1641, 1642, 1643, 1644, 1645, 1646};




//Yoke segment 1, -Y, +Z (Group 24)

Yokelength24 = Yokelength11;

Ys24refx = SCrefx;
Ys24refy = SCrefy - SCdim - segsep;
Ys24refz = SCrefz - Yokeconn + Yokesep + Shieldwidth;



Point(2401) = {Ys24refx, Ys24refy - SCsep, Ys24refz, Yokeres};
Point(2402) = {Ys24refx, Ys24refy - Yokelength24, Ys24refz, Yokeres};
Point(2403) = {Ys24refx - Beamwidth, Ys24refy - Yokelength24, Ys24refz, Yokeres};
Point(2404) = {Ys24refx - Beamwidth, Ys24refy - SCsep, Ys24refz, Yokeres};
Point(2405) = {Ys24refx, Ys24refy - SCsep, Ys24refz - Shieldwidth + Beamwidth, Yokeres};
Point(2406) = {Ys24refx, Ys24refy - Yokelength24, Ys24refz - Shieldwidth + Beamwidth, Yokeres};
Point(2407) = {Ys24refx - Yokewidth, Ys24refy - Yokelength24, Ys24refz - Shieldwidth + Beamwidth, Yokeres};
Point(2408) = {Ys24refx - Yokewidth, Ys24refy - SCsep, Ys24refz - Shieldwidth + Beamwidth, Yokeres};
Point(2409) = {Ys24refx, Ys24refy - SCsep, Ys24refz - Shieldwidth, Yokeres};
Point(2410) = {Ys24refx, Ys24refy - Yokelength24, Ys24refz - Shieldwidth, Yokeres};
Point(2411) = {Ys24refx - Beamwidth, Ys24refy - Yokelength24, Ys24refz - Shieldwidth*0.64, Yokeres};
Point(2412) = {Ys24refx - Beamwidth, Ys24refy - SCsep, Ys24refz - Shieldwidth*0.64, Yokeres};

Line(2413) = {2401, 2402};
Line(2414) = {2402, 2403};
Line(2415) = {2403, 2404};
Line(2416) = {2404, 2401};
Line(2417) = {2405, 2406};
Line(2418) = {2406, 2407};
Line(2419) = {2407, 2408};
Line(2420) = {2408, 2405};
Line(2421) = {2409, 2410};
Line(2422) = {2410, 2411};
Line(2423) = {2411, 2412};
Line(2424) = {2412, 2409};
Line(2425) = {2401, 2408};
Line(2426) = {2405, 2409};
Line(2427) = {2402, 2407};
Line(2428) = {2406, 2410};
Line(2429) = {2403, 2411};
Line(2430) = {2404, 2412};

Line Loop(2431) = {2413, 2414, 2415, 2416};
Line Loop(2432) = {2417, 2418, 2419, 2420};
Line Loop(2433) = {2421, 2422, 2423, 2424};
Line Loop(2434) = {-2419, -2427, -2413, 2425};
Line Loop(2435) = {2421, -2428, -2417, 2426};
Line Loop(2436) = {-2423, -2429, 2415, 2430};
Line Loop(2437) = {2425, 2420, 2426, -2424, -2430, 2416};
Line Loop(2438) = {2427, -2418, 2428, 2422, -2429, -2414};

Plane Surface(2439) = {2431};
Plane Surface(2440) = {2432};
Plane Surface(2441) = {2433};
Plane Surface(2442) = {2434};
Plane Surface(2443) = {2435};
Plane Surface(2444) = {2436};
Plane Surface(2445) = {2437};
Plane Surface(2446) = {2438};

Surface Loop(24) = {2439, 2440, 2441, 2442, 2443, 2444, 2445, 2446};




//Yoke segment 1, -Y, -Z (Group 18)

Yokelength18 = Yokelength11;

Ys18refx = SCrefx;
Ys18refy = SCrefy - segsep - SCdim;
Ys18refz = SCrefz - Yokeconn - Yokesep;



Point(1801) = {Ys18refx, Ys18refy - SCsep, Ys18refz, Yokeres};
Point(1802) = {Ys18refx, Ys18refy - Yokelength18, Ys18refz, Yokeres};
Point(1803) = {Ys18refx - Beamwidth, Ys18refy - Yokelength18, Ys18refz, Yokeres};
Point(1804) = {Ys18refx - Beamwidth, Ys18refy - SCsep, Ys18refz, Yokeres};
Point(1805) = {Ys18refx, Ys18refy - SCsep, Ys18refz - Shieldwidth + Beamwidth, Yokeres};
Point(1806) = {Ys18refx, Ys18refy - Yokelength18, Ys18refz - Shieldwidth + Beamwidth, Yokeres};
Point(1807) = {Ys18refx - Yokewidth, Ys18refy - Yokelength18, Ys18refz - Shieldwidth + Beamwidth, Yokeres};
Point(1808) = {Ys18refx - Yokewidth, Ys18refy - SCsep, Ys18refz - Shieldwidth + Beamwidth, Yokeres};
Point(1809) = {Ys18refx, Ys18refy - SCsep, Ys18refz - Shieldwidth, Yokeres};
Point(1810) = {Ys18refx, Ys18refy - Yokelength18, Ys18refz - Shieldwidth, Yokeres};
Point(1811) = {Ys18refx - Beamwidth, Ys18refy - Yokelength18, Ys18refz - Shieldwidth*0.64, Yokeres};
Point(1812) = {Ys18refx - Beamwidth, Ys18refy - SCsep, Ys18refz - Shieldwidth*0.64, Yokeres};

Line(1813) = {1801, 1802};
Line(1814) = {1802, 1803};
Line(1815) = {1803, 1804};
Line(1816) = {1804, 1801};
Line(1817) = {1805, 1806};
Line(1818) = {1806, 1807};
Line(1819) = {1807, 1808};
Line(1820) = {1808, 1805};
Line(1821) = {1809, 1810};
Line(1822) = {1810, 1811};
Line(1823) = {1811, 1812};
Line(1824) = {1812, 1809};
Line(1825) = {1801, 1808};
Line(1826) = {1805, 1809};
Line(1827) = {1802, 1807};
Line(1828) = {1806, 1810};
Line(1829) = {1803, 1811};
Line(1830) = {1804, 1812};

Line Loop(1831) = {1813, 1814, 1815, 1816};
Line Loop(1832) = {1817, 1818, 1819, 1820};
Line Loop(1833) = {1821, 1822, 1823, 1824};
Line Loop(1834) = {-1819, -1827, -1813, 1825};
Line Loop(1835) = {1821, -1828, -1817, 1826};
Line Loop(1836) = {-1823, -1829, 1815, 1830};
Line Loop(1837) = {1825, 1820, 1826, -1824, -1830, 1816};
Line Loop(1838) = {1827, -1818, 1828, 1822, -1829, -1814};

Plane Surface(1839) = {1831};
Plane Surface(1840) = {1832};
Plane Surface(1841) = {1833};
Plane Surface(1842) = {1834};
Plane Surface(1843) = {1835};
Plane Surface(1844) = {1836};
Plane Surface(1845) = {1837};
Plane Surface(1846) = {1838};

Surface Loop(18) = {1839, 1840, 1841, 1842, 1843, 1844, 1845, 1846};




//Yoke segment 2, -Y, -Z (Group 19)

Yokelength19 = OSRwidth;

Ys19refx = SCrefx;
Ys19refy = SCrefy - SCdim - segsep - Yokelength18 - segsep;
Ys19refz = SCrefz - Yokeconn - Yokesep;




Point(1901) = {Ys19refx, Ys19refy, Ys19refz, Yokeres};
Point(1902) = {Ys19refx, Ys19refy - Yokelength19, Ys19refz, Yokeres};
Point(1903) = {Ys19refx - Beamwidth, Ys19refy - Yokelength19, Ys19refz, YokeOSRres};
Point(1904) = {Ys19refx - Beamwidth, Ys19refy, Ys19refz, YokeOSRres};
Point(1905) = {Ys19refx, Ys19refy, Ys19refz - Shieldwidth + Beamwidth, Yokeres};
Point(1906) = {Ys19refx, Ys19refy - Yokelength19, Ys19refz - Shieldwidth + Beamwidth, Yokeres};
Point(1907) = {Ys19refx - Yokewidth, Ys19refy - Yokelength12, Ys19refz - Shieldwidth + Beamwidth, Yokeres};
Point(1908) = {Ys19refx - Yokewidth, Ys19refy, Ys19refz - Shieldwidth + Beamwidth, Yokeres};
Point(1909) = {Ys19refx, Ys19refy, Ys19refz - Shieldwidth, Yokeres};
Point(1910) = {Ys19refx, Ys19refy - Yokelength19, Ys19refz - Shieldwidth, Yokeres};
Point(1911) = {Ys19refx - Beamwidth, Ys19refy - Yokelength19, Ys19refz - Shieldwidth*0.64, YokeOSRres};
Point(1912) = {Ys19refx - Beamwidth, Ys19refy, Ys19refz - Shieldwidth*0.64, YokeOSRres};

Line(1913) = {1901, 1902};
Line(1914) = {1902, 1903};
Line(1915) = {1903, 1904};
Line(1916) = {1904, 1901};
Line(1917) = {1905, 1906};
Line(1918) = {1906, 1907};
Line(1919) = {1907, 1908};
Line(1920) = {1908, 1905};
Line(1921) = {1909, 1910};
Line(1922) = {1910, 1911};
Line(1923) = {1911, 1912};
Line(1924) = {1912, 1909};
Line(1925) = {1901, 1908};
Line(1926) = {1905, 1909};
Line(1927) = {1902, 1907};
Line(1928) = {1906, 1910};
Line(1929) = {1903, 1911};
Line(1930) = {1904, 1912};

Line Loop(1931) = {1913, 1914, 1915, 1916};
Line Loop(1932) = {1917, 1918, 1919, 1920};
Line Loop(1933) = {1921, 1922, 1923, 1924};
Line Loop(1934) = {-1919, -1927, -1913, 1925};
Line Loop(1935) = {1921, -1928, -1917, 1926};
Line Loop(1936) = {-1923, -1929, 1915, 1930};
Line Loop(1937) = {1925, 1920, 1926, -1924, -1930, 1916};
Line Loop(1938) = {1927, -1918, 1928, 1922, -1929, -1914};

Plane Surface(1939) = {1931};
Plane Surface(1940) = {1932};
Plane Surface(1941) = {1933};
Plane Surface(1942) = {1934};
Plane Surface(1943) = {1935};
Plane Surface(1944) = {1936};
Plane Surface(1945) = {1937};
Plane Surface(1946) = {1938};


Surface Loop(19) = {1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946};



//Yoke segment 2, -Y, +Z (Group 23)

Yokelength23 = OSRwidth;

Ys23refx = SCrefx;
Ys23refy = SCrefy - SCdim - segsep - Yokelength24 - segsep;
Ys23refz = SCrefz - Yokeconn + Yokesep + Shieldwidth;



Point(2301) = {Ys23refx, Ys23refy, Ys23refz, Yokeres};
Point(2302) = {Ys23refx, Ys23refy - Yokelength23, Ys23refz, Yokeres};
Point(2303) = {Ys23refx - Beamwidth, Ys23refy - Yokelength23, Ys23refz, YokeOSRres};
Point(2304) = {Ys23refx - Beamwidth, Ys23refy, Ys23refz, YokeOSRres};
Point(2305) = {Ys23refx, Ys23refy, Ys23refz - Shieldwidth + Beamwidth, Yokeres};
Point(2306) = {Ys23refx, Ys23refy - Yokelength23, Ys23refz - Shieldwidth + Beamwidth, Yokeres};
Point(2307) = {Ys23refx - Yokewidth, Ys23refy - Yokelength12, Ys23refz - Shieldwidth + Beamwidth, Yokeres};
Point(2308) = {Ys23refx - Yokewidth, Ys23refy, Ys23refz - Shieldwidth + Beamwidth, Yokeres};
Point(2309) = {Ys23refx, Ys23refy, Ys23refz - Shieldwidth, Yokeres};
Point(2310) = {Ys23refx, Ys23refy - Yokelength23, Ys23refz - Shieldwidth, Yokeres};
Point(2311) = {Ys23refx - Beamwidth, Ys23refy - Yokelength23, Ys23refz - Shieldwidth*0.64, YokeOSRres};
Point(2312) = {Ys23refx - Beamwidth, Ys23refy, Ys23refz - Shieldwidth*0.64, YokeOSRres};

Line(2313) = {2301, 2302};
Line(2314) = {2302, 2303};
Line(2315) = {2303, 2304};
Line(2316) = {2304, 2301};
Line(2317) = {2305, 2306};
Line(2318) = {2306, 2307};
Line(2319) = {2307, 2308};
Line(2320) = {2308, 2305};
Line(2321) = {2309, 2310};
Line(2322) = {2310, 2311};
Line(2323) = {2311, 2312};
Line(2324) = {2312, 2309};
Line(2325) = {2301, 2308};
Line(2326) = {2305, 2309};
Line(2327) = {2302, 2307};
Line(2328) = {2306, 2310};
Line(2329) = {2303, 2311};
Line(2330) = {2304, 2312};

Line Loop(2331) = {2313, 2314, 2315, 2316};
Line Loop(2332) = {2317, 2318, 2319, 2320};
Line Loop(2333) = {2321, 2322, 2323, 2324};
Line Loop(2334) = {-2319, -2327, -2313, 2325};
Line Loop(2335) = {2321, -2328, -2317, 2326};
Line Loop(2336) = {-2323, -2329, 2315, 2330};
Line Loop(2337) = {2325, 2320, 2326, -2324, -2330, 2316};
Line Loop(2338) = {2327, -2318, 2328, 2322, -2329, -2314};

Plane Surface(2339) = {2331};
Plane Surface(2340) = {2332};
Plane Surface(2341) = {2333};
Plane Surface(2342) = {2334};
Plane Surface(2343) = {2335};
Plane Surface(2344) = {2336};
Plane Surface(2345) = {2337};
Plane Surface(2346) = {2338};

Surface Loop(23) = {2339, 2340, 2341, 2342, 2343, 2344, 2345, 2346};



//Yoke segment 3, +Y, +Z (Group 13)

Shortyokelength = 0.10;
Slantedlength = Arraywidth/2 - Shieldwidth - Yokesep;

Ys13refx = SCrefx;
Ys13refy = SCrefy + Yoketotallength - segsep;
Ys13refz = SCrefz - Yokeconn + Arraywidth/2;



Point(1301) = {Ys13refx, Ys13refy, Ys13refz, Yokeres};
Point(1302) = {Ys13refx, Ys13refy - Shortyokelength - Shieldwidth*Tan(Pi/8), Ys13refz, Yokeres};
Point(1303) = {Ys13refx, Ys13refy - Shortyokelength - Slantedlength - Shieldwidth*Tan(Pi/8), Ys12refz, Yokeres};
Point(1304) = {Ys12refx, Ys12refy + segsep, Ys12refz, Yokeres};
Point(1305) = {Ys12refx - Beamwidth, Ys12refy + segsep, Ys12refz, Yokeres};
Point(1306) = {Ys13refx - Beamwidth, Ys13refy - Shortyokelength - Slantedlength - Shieldwidth*Tan(Pi/8), Ys12refz, Yokeres};
Point(1307) = {Ys13refx - Beamwidth, Ys13refy - Shortyokelength - Shieldwidth*Tan(Pi/8), Ys13refz, Yokeres};
Point(1308) = {Ys13refx - Beamwidth, Ys13refy, Ys13refz, Yokeres};
Point(1309) = {Ys13refx, Ys13refy, Ys13refz - Shieldwidth + Beamwidth, Yokeres};
Point(1310) = {Ys13refx, Ys13refy - Shortyokelength - Beamwidth*Tan(Pi/8), Ys13refz - Shieldwidth + Beamwidth, Yokeres};
Point(1311) = {Ys13refx, Ys13refy - Shortyokelength - Slantedlength - Beamwidth*Tan(Pi/8), Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1312) = {Ys12refx, Ys12refy + segsep, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1313) = {Ys12refx - Yokewidth, Ys12refy + segsep, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1314) = {Ys13refx - Yokewidth,  Ys13refy - Shortyokelength - Beamwidth*Tan(Pi/8) - Slantedlength, Ys12refz - Shieldwidth + Beamwidth, Yokeres};
Point(1315) = {Ys13refx - Yokewidth, Ys13refy - Shortyokelength - Beamwidth*Tan(Pi/8), Ys13refz - Shieldwidth + Beamwidth, Yokeres};
Point(1316) = {Ys13refx - Yokewidth, Ys13refy, Ys13refz - Shieldwidth + Beamwidth, Yokeres};
Point(1317) = {Ys13refx, Ys13refy, Ys13refz - Shieldwidth, Yokeres};
Point(1318) = {Ys13refx, Ys13refy - Shortyokelength, Ys13refz - Shieldwidth, Yokeres};
Point(1319) = {Ys13refx, Ys13refy - Shortyokelength - Slantedlength, Ys13refz - Arraywidth/2 + Yokesep, Yokeres};
Point(1320) = {Ys12refx, Ys12refy + segsep, Ys12refz - Shieldwidth, Yokeres};
Point(1321) = {Ys12refx - Beamwidth, Ys12refy + segsep, Ys12refz - Shieldwidth*0.64, Yokeres};
Point(1322) = {Ys13refx - Beamwidth, Ys13refy - Shortyokelength - Slantedlength, Ys13refz - Arraywidth/2 + Yokesep + Shieldwidth*0.36, Yokeres};
Point(1323) = {Ys13refx - Beamwidth, Ys13refy - Shortyokelength , Ys13refz - Shieldwidth*0.64, Yokeres};
Point(1324) = {Ys13refx - Beamwidth, Ys13refy, Ys13refz - Shieldwidth*0.64, Yokeres};

Line(1325) = {1301, 1302};
Line(1326) = {1302, 1303};
Line(1327) = {1303, 1304};
Line(1328) = {1304, 1305};
Line(1329) = {1305, 1306};
Line(1330) = {1306, 1307};
Line(1331) = {1307, 1308};
Line(1332) = {1308, 1301};
Line(1333) = {1302, 1307};
Line(1334) = {1303, 1306};
Line(1335) = {1301, 1316};
Line(1336) = {1316, 1315};
Line(1337) = {1315, 1302};
//Line(1338) = {1302, 1301};
Line(1339) = {1315, 1314};
Line(1340) = {1314, 1303};
Line(1341) = {1314, 1313};
Line(1342) = {1313, 1304};
Line(1343) = {1316, 1309};
Line(1344) = {1309, 1310};
Line(1345) = {1315, 1310};
Line(1346) = {1310, 1311};
Line(1347) = {1314, 1311};
Line(1348) = {1311, 1312};
Line(1349) = {1312, 1313};
Line(1350) = {1309, 1317};
Line(1351) = {1317, 1318};
Line(1352) = {1318, 1310};
Line(1353) = {1318, 1319};
Line(1354) = {1319, 1311};
Line(1355) = {1319, 1320};
Line(1356) = {1320, 1312};
Line(1357) = {1317, 1324};
Line(1358) = {1324, 1323};
Line(1359) = {1323, 1318};
Line(1360) = {1323, 1322};
Line(1361) = {1322, 1319};
Line(1362) = {1322, 1321};
Line(1363) = {1321, 1320};
Line(1364) = {1308, 1324};
Line(1365) = {1307, 1323};
Line(1366) = {1306, 1322};
Line(1367) = {1305, 1321};

Line Loop(1368) = {1325, 1333, 1331, 1332};
Plane Surface(1301) = {1368};
Line Loop(1369) = {1326, 1334, 1330, -1333};
Plane Surface(1302) = {1369};
Line Loop(1370) = {1327, 1328, 1329, -1334};
Plane Surface(1303) = {1370};
Line Loop(1371) = {1335, 1336, 1337, -1325};
Plane Surface(1304) = {1371};
Line Loop(1372) = {-1337, 1339, 1340, -1326};
Plane Surface(1305) = {1372};
Line Loop(1373) = {-1340, 1341, 1342, -1327};
Plane Surface(1306) = {1373};
Line Loop(1374) = {1343, 1344, -1345, -1336};
Plane Surface(1307) = {1374};
Line Loop(1375) = {1345, 1346, -1347, -1339};
Plane Surface(1308) = {1375};
Line Loop(1376) = {1347, 1348, 1349, -1341};
Plane Surface(1309) = {1376};
Line Loop(1377) = {1350, 1351, 1352, -1344};
Plane Surface(1310) = {1377};
Line Loop(1378) = {-1352, 1353, 1354, -1346};
Plane Surface(1311) = {1378};
Line Loop(1379) = {-1354, 1355, 1356, -1348};
Plane Surface(1312) = {1379};
Line Loop(1380) = {-1357, 1351, -1359, -1358};
Plane Surface(1313) = {1380};
Line Loop(1381) = {1359, 1353, -1361, -1360};
Plane Surface(1314) = {1381};
Line Loop(1382) = {1361, 1355, -1363, -1362};
Plane Surface(1315) = {1382};
Line Loop(1383) = {1364, 1358, -1365, 1331};
Plane Surface(1316) = {1383};
Line Loop(1384) = {1365, 1360, -1366, 1330};
Plane Surface(1317) = {1384};
Line Loop(1385) = {1366, 1362, -1367, 1329};
Plane Surface(1318) = {1385};
Line Loop(1386) = {1364, -1357, -1350, -1343, -1335, -1332};
Plane Surface(1319) = {1386};
Line Loop(1387) = {1367, 1363, 1356, 1349, 1342, 1328};
Plane Surface(1320) = {1387};

Surface Loop(13) = {1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1317, 1318, 1319, 1320};



//Yoke segment 3, +Y, -Z (Group 15)

Ys15refx = SCrefx;
Ys15refy = SCrefy + Yoketotallength - segsep;
Ys15refz = SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth;



Point(1501) = {Ys15refx, Ys15refy, Ys15refz, Yokeres};
Point(1502) = {Ys15refx, Ys15refy - Shortyokelength, Ys15refz, Yokeres};
Point(1503) = {Ys15refx, Ys15refy - Shortyokelength - Slantedlength, Ys16refz, Yokeres};
Point(1504) = {Ys16refx, Ys16refy + segsep, Ys16refz, Yokeres};
Point(1505) = {Ys16refx - Beamwidth, Ys16refy + segsep, Ys16refz, Yokeres};
Point(1506) = {Ys15refx - Beamwidth, Ys15refy - Shortyokelength - Slantedlength, Ys16refz, Yokeres};
Point(1507) = {Ys15refx - Beamwidth, Ys15refy - Shortyokelength ,Ys15refz, Yokeres};
Point(1508) = {Ys15refx - Beamwidth, Ys15refy, Ys15refz, Yokeres};
Point(1509) = {Ys15refx, Ys15refy, Ys15refz - Shieldwidth + Beamwidth, Yokeres};
Point(1510) = {Ys15refx, Ys15refy - Shortyokelength - (Shieldwidth - Beamwidth)*Tan(Pi/8), Ys15refz - Shieldwidth + Beamwidth, Yokeres};
Point(1511) = {Ys15refx, Ys15refy - Shortyokelength - Slantedlength - (Shieldwidth-Beamwidth)*Tan(Pi/8), Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1512) = {Ys16refx, Ys16refy + segsep, Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1513) = {Ys16refx - Yokewidth, Ys16refy + segsep, Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1514) = {Ys15refx - Yokewidth, Ys15refy - Shortyokelength - Slantedlength - (Shieldwidth-Beamwidth)*Tan(Pi/8), Ys16refz - Shieldwidth + Beamwidth, Yokeres};
Point(1515) = {Ys15refx - Yokewidth, Ys15refy - Shortyokelength - (Shieldwidth - Beamwidth)*Tan(Pi/8), Ys15refz - Shieldwidth + Beamwidth, Yokeres};
Point(1516) = {Ys15refx - Yokewidth, Ys15refy, Ys15refz - Shieldwidth + Beamwidth, Yokeres};
Point(1517) = {Ys15refx, Ys15refy, Ys15refz - Shieldwidth, Yokeres};
Point(1518) = {Ys15refx, Ys15refy - Shortyokelength - Shieldwidth*Tan(Pi/8)  , Ys15refz - Shieldwidth, Yokeres};
Point(1519) = {Ys15refx, Ys13refy - Shortyokelength - Slantedlength - Shieldwidth*Tan(Pi/8), Ys16refz - Shieldwidth, Yokeres};
Point(1520) = {Ys16refx, Ys16refy + segsep, Ys16refz - Shieldwidth, Yokeres};
Point(1521) = {Ys16refx - Beamwidth, Ys16refy + segsep, Ys16refz - Shieldwidth*0.64, Yokeres};
Point(1522) = {Ys15refx - Beamwidth,  Ys13refy - Shortyokelength - Slantedlength - Shieldwidth*Tan(Pi/8), Ys16refz - Shieldwidth*0.64, Yokeres};
Point(1523) = {Ys15refx - Beamwidth,  Ys15refy - Shortyokelength - Shieldwidth*Tan(Pi/8), Ys15refz - Shieldwidth*0.64, Yokeres};
Point(1524) = {Ys15refx - Beamwidth, Ys15refy, Ys15refz - Shieldwidth*0.64, Yokeres};


Line(1525) = {1501, 1502};
Line(1526) = {1502, 1503};
Line(1527) = {1503, 1504};
Line(1528) = {1504, 1505};
Line(1529) = {1505, 1506};
Line(1530) = {1506, 1507};
Line(1531) = {1507, 1508};
Line(1532) = {1508, 1501};
Line(1533) = {1502, 1507};
Line(1534) = {1503, 1506};
Line(1535) = {1501, 1516};
Line(1536) = {1516, 1515};
Line(1537) = {1515, 1502};
//Line(1538) = {1502, 1501};
Line(1539) = {1515, 1514};
Line(1540) = {1514, 1503};
Line(1541) = {1512, 1511};
Line(1542) = {1513, 1504};
Line(1543) = {1516, 1509};
Line(1544) = {1509, 1510};
Line(1545) = {1515, 1510};
Line(1546) = {1510, 1511};
Line(1547) = {1514, 1511};
Line(1548) = {1514, 1513};
Line(1549) = {1513, 1512};
Line(1550) = {1509, 1517};
Line(1551) = {1517, 1518};
Line(1552) = {1518, 1510};
Line(1553) = {1518, 1519};
Line(1554) = {1519, 1511};
Line(1555) = {1519, 1520};
Line(1556) = {1520, 1512};
Line(1557) = {1517, 1524};
Line(1558) = {1524, 1523};
Line(1559) = {1523, 1518};
Line(1560) = {1523, 1522};
Line(1561) = {1522, 1519};
Line(1562) = {1522, 1521};
Line(1563) = {1521, 1520};
Line(1564) = {1508, 1524};
Line(1565) = {1507, 1523};
Line(1566) = {1506, 1522};
Line(1567) = {1505, 1521};

Line Loop(1568) = {1525, 1533, 1531, 1532};
Plane Surface(1501) = {1568};
Line Loop(1569) = {1526, 1534, 1530, -1533};
Plane Surface(1502) = {1569};
Line Loop(1570) = {1527, 1528, 1529, -1534};
Plane Surface(1503) = {1570};
Line Loop(1571) = {1535, 1536, 1537, -1525};
Plane Surface(1504) = {1571};
Line Loop(1572) = {-1537, 1539, 1540, -1526};
Plane Surface(1505) = {1572};
Line Loop(1573) = {-1540, 1548, 1542, -1527};
Plane Surface(1506) = {1573};
Line Loop(1574) = {1543, 1544, -1545, -1536};
Plane Surface(1507) = {1574};
Line Loop(1575) = {1545, 1546, -1547, -1539};
Plane Surface(1508) = {1575};
Line Loop(1576) = {-1547, 1548, 1549, 1541};
Plane Surface(1509) = {1576};
Line Loop(1577) = {1550, 1551, 1552, -1544};
Plane Surface(1510) = {1577};
Line Loop(1578) = {-1552, 1553, 1554, -1546};
Plane Surface(1511) = {1578};
Line Loop(1579) = {-1554, 1555, 1556, 1541};
Plane Surface(1512) = {1579};
Line Loop(1580) = {-1557, 1551, -1559, -1558};
Plane Surface(1513) = {1580};
Line Loop(1581) = {1559, 1553, -1561, -1560};
Plane Surface(1514) = {1581};
Line Loop(1582) = {1561, 1555, -1563, -1562};
Plane Surface(1515) = {1582};
Line Loop(1583) = {1564, 1558, -1565, 1531};
Plane Surface(1516) = {1583};
Line Loop(1584) = {1565, 1560, -1566, 1530};
Plane Surface(1517) = {1584};
Line Loop(1585) = {1566, 1562, -1567, 1529};
Plane Surface(1518) = {1585};
Line Loop(1586) = {1564, -1557, -1550, -1543, -1535, -1532};
Plane Surface(1519) = {1586};
Line Loop(1587) = {1567, 1563, 1556, -1549, 1542, 1528};
Plane Surface(1520) = {1587};

Surface Loop(15) = {1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520};



//Yoke segment 3, -Y, -Z (Group 20)

Ys20refx = SCrefx;
Ys20refy = SCrefy - SCdim - Yokelength19 - segsep - Yokelength18 - segsep - segsep;
Ys20refz = Ys19refz;




Point(2001) = {Ys20refx, Ys20refy, Ys20refz, Yokeres};
Point(2002) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Slantedlength, Ys20refz, Yokeres};
Point(2003) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength, SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth, Yokeres};
Point(2004) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth, Yokeres};
Point(2005) = {Ys20refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth, Yokeres};
Point(2006) = {Ys20refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength, SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth, Yokeres};
Point(2007) = {Ys20refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Slantedlength, Ys20refz, Yokeres};
Point(2008) = {Ys20refx - Beamwidth, Ys20refy, Ys20refz, Yokeres};
Point(2009) = {Ys20refx, Ys20refy, Ys20refz - Shieldwidth + Beamwidth, Yokeres};
Point(2010) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth) + Slantedlength - Tan(Pi/8)*Beamwidth, Ys20refz - Shieldwidth + Beamwidth, Yokeres};
Point(2011) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth - Beamwidth), SCrefz - Yokeconn - Arraywidth/2 + Beamwidth, Yokeres};
Point(2012) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn - Arraywidth/2 + Beamwidth, Yokeres};
Point(2013) = {Ys20refx - Yokewidth, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn - Arraywidth/2 + Beamwidth, Yokeres};
Point(2014) = {Ys20refx - Yokewidth, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth - Beamwidth), SCrefz - Yokeconn - Arraywidth/2 + Beamwidth, Yokeres};
Point(2015) = {Ys20refx - Yokewidth, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth) + Slantedlength - Tan(Pi/8)*Beamwidth, Ys20refz - Shieldwidth + Beamwidth, Yokeres};
Point(2016) = {Ys20refx - Yokewidth, Ys20refy, Ys20refz - Shieldwidth + Beamwidth, Yokeres};
Point(2017) = {Ys20refx, Ys20refy, Ys20refz - Shieldwidth, Yokeres};
Point(2018) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth) + Slantedlength, Ys20refz - Shieldwidth, Yokeres};
Point(2019) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth), SCrefz - Yokeconn - Arraywidth/2, Yokeres};
Point(2020) = {Ys20refx, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn - Arraywidth/2, Yokeres};
Point(2021) = {Ys20refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth*0.36, Yokeres};
Point(2022) = {Ys20refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth), SCrefz - Yokeconn - Arraywidth/2 + Shieldwidth*0.36, Yokeres};
Point(2023) = {Ys20refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep  + Shortyokelength + Tan(Pi/8)*(Shieldwidth) + Slantedlength, Ys20refz - Shieldwidth*0.64, Yokeres};
Point(2024) = {Ys20refx - Beamwidth, Ys20refy, Ys20refz - Shieldwidth*0.64, Yokeres};

Line(2025) = {2001, 2002};
Line(2026) = {2002, 2003};
Line(2027) = {2003, 2004};
Line(2028) = {2004, 2005};
Line(2029) = {2005, 2006};
Line(2030) = {2006, 2007};
Line(2031) = {2007, 2008};
Line(2032) = {2008, 2001};
Line(2033) = {2002, 2007};
Line(2034) = {2003, 2006};
Line(2035) = {2001, 2016};
Line(2036) = {2016, 2015};
Line(2037) = {2015, 2002};
//Line(2038) = {2002, 2001};
Line(2039) = {2015, 2014};
Line(2040) = {2014, 2003};
Line(2041) = {2012, 2011};
Line(2042) = {2013, 2004};
Line(2043) = {2016, 2009};
Line(2044) = {2009, 2010};
Line(2045) = {2015, 2010};
Line(2046) = {2010, 2011};
Line(2047) = {2014, 2011};
Line(2048) = {2014, 2013};
Line(2049) = {2013, 2012};
Line(2050) = {2009, 2017};
Line(2051) = {2017, 2018};
Line(2052) = {2018, 2010};
Line(2053) = {2018, 2019};
Line(2054) = {2019, 2011};
Line(2055) = {2019, 2020};
Line(2056) = {2020, 2012};
Line(2057) = {2017, 2024};
Line(2058) = {2024, 2023};
Line(2059) = {2023, 2018};
Line(2060) = {2023, 2022};
Line(2061) = {2022, 2019};
Line(2062) = {2022, 2021};
Line(2063) = {2021, 2020};
Line(2064) = {2008, 2024};
Line(2065) = {2007, 2023};
Line(2066) = {2006, 2022};
Line(2067) = {2005, 2021};

Line Loop(2068) = {2025, 2033, 2031, 2032};
Plane Surface(2001) = {2068};
Line Loop(2069) = {2026, 2034, 2030, -2033};
Plane Surface(2002) = {2069};
Line Loop(2070) = {2027, 2028, 2029, -2034};
Plane Surface(2003) = {2070};
Line Loop(2071) = {2035, 2036, 2037, -2025};
Plane Surface(2004) = {2071};
Line Loop(2072) = {-2037, 2039, 2040, -2026};
Plane Surface(2005) = {2072};
Line Loop(2073) = {-2040, 2048, 2042, -2027};
Plane Surface(2006) = {2073};
Line Loop(2074) = {2043, 2044, -2045, -2036};
Plane Surface(2007) = {2074};
Line Loop(2075) = {2045, 2046, -2047, -2039};
Plane Surface(2008) = {2075};
Line Loop(2076) = {-2047, 2048, 2049, 2041};
Plane Surface(2009) = {2076};
Line Loop(2077) = {2050, 2051, 2052, -2044};
Plane Surface(2010) = {2077};
Line Loop(2078) = {-2052, 2053, 2054, -2046};
Plane Surface(2011) = {2078};
Line Loop(2079) = {-2054, 2055, 2056, 2041};
Plane Surface(2012) = {2079};
Line Loop(2080) = {-2057, 2051, -2059, -2058};
Plane Surface(2013) = {2080};
Line Loop(2081) = {2059, 2053, -2061, -2060};
Plane Surface(2014) = {2081};
Line Loop(2082) = {2061, 2055, -2063, -2062};
Plane Surface(2015) = {2082};
Line Loop(2083) = {2064, 2058, -2065, 2031};
Plane Surface(2016) = {2083};
Line Loop(2084) = {2065, 2060, -2066, 2030};
Plane Surface(2017) = {2084};
Line Loop(2085) = {2066, 2062, -2067, 2029};
Plane Surface(2018) = {2085};
Line Loop(2086) = {2064, -2057, -2050, -2043, -2035, -2032};
Plane Surface(2019) = {2086};
Line Loop(2087) = {2067, 2063, 2056, -2049, 2042, 2028};
Plane Surface(2020) = {2087};

Surface Loop(20) = {2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020};



//Yoke segment 3, -Y, +Z (Group 22)

Ys22refx = SCrefx;
Ys22refy = SCrefy - SCdim - Yokelength23 - segsep - Yokelength24 - segsep - segsep;
Ys22refz = Ys23refz;



Point(2201) = {Ys22refx, Ys22refy, Ys22refz, Yokeres};
Point(2202) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Shieldwidth + Slantedlength, Ys22refz, Yokeres};
Point(2203) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Shieldwidth, SCrefz - Yokeconn + Arraywidth/2, Yokeres};
Point(2204) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn + Arraywidth/2, Yokeres};
Point(2205) = {Ys22refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn + Arraywidth/2, Yokeres};
Point(2206) = {Ys22refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Shieldwidth, SCrefz - Yokeconn + Arraywidth/2, Yokeres};
Point(2207) = {Ys22refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Shieldwidth + Slantedlength, Ys22refz, Yokeres};
Point(2208) = {Ys22refx - Beamwidth, Ys22refy, Ys22refz, Yokeres};
Point(2209) = {Ys22refx, Ys22refy, Ys22refz - Shieldwidth + Beamwidth, Yokeres};
Point(2210) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Beamwidth + Slantedlength, Ys22refz - Shieldwidth + Beamwidth, Yokeres};
Point(2211) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Beamwidth, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth + Beamwidth, Yokeres};
Point(2212) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth + Beamwidth, Yokeres};
Point(2213) = {Ys22refx - Yokewidth, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth + Beamwidth, Yokeres};
Point(2214) = {Ys22refx - Yokewidth, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Beamwidth, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth + Beamwidth, Yokeres};
Point(2215) = {Ys22refx - Yokewidth, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Tan(Pi/8)*Beamwidth + Slantedlength, Ys22refz - Shieldwidth + Beamwidth, Yokeres};
Point(2216) = {Ys22refx - Yokewidth, Ys22refy, Ys22refz - Shieldwidth + Beamwidth, Yokeres};
Point(2217) = {Ys22refx, Ys22refy, Ys22refz - Shieldwidth, Yokeres};
Point(2218) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Slantedlength, Ys22refz - Shieldwidth, Yokeres};

Point(2219) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth, Yokeres};
Point(2220) = {Ys22refx, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth, Yokeres};
Point(2221) = {Ys22refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth*0.64, Yokeres};
Point(2222) = {Ys22refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength, SCrefz - Yokeconn + Arraywidth/2 - Shieldwidth*0.64, Yokeres};
Point(2223) = {Ys22refx - Beamwidth, SCrefy - SCdim - Yoketotallength + segsep + Shortyokelength + Slantedlength, Ys22refz - Shieldwidth*0.64, Yokeres};
Point(2224) = {Ys22refx - Beamwidth, Ys22refy, Ys22refz - Shieldwidth*0.64, Yokeres};

Line(2225) = {2201, 2202};
Line(2226) = {2202, 2203};
Line(2227) = {2203, 2204};
Line(2228) = {2204, 2205};
Line(2229) = {2205, 2206};
Line(2230) = {2206, 2207};
Line(2231) = {2207, 2208};
Line(2232) = {2208, 2201};
Line(2233) = {2202, 2207};
Line(2234) = {2203, 2206};
Line(2235) = {2201, 2216};
Line(2236) = {2216, 2215};
Line(2237) = {2215, 2202};
//Line(2238) = {2202, 2201};
Line(2239) = {2215, 2214};
Line(2240) = {2214, 2203};
Line(2241) = {2212, 2211};
Line(2242) = {2213, 2204};
Line(2243) = {2216, 2209};
Line(2244) = {2209, 2210};
Line(2245) = {2215, 2210};
Line(2246) = {2210, 2211};
Line(2247) = {2214, 2211};
Line(2248) = {2214, 2213};
Line(2249) = {2213, 2212};
Line(2250) = {2209, 2217};
Line(2251) = {2217, 2218};
Line(2252) = {2218, 2210};
Line(2253) = {2218, 2219};
Line(2254) = {2219, 2211};
Line(2255) = {2219, 2220};
Line(2256) = {2220, 2212};
Line(2257) = {2217, 2224};
Line(2258) = {2224, 2223};
Line(2259) = {2223, 2218};
Line(2260) = {2223, 2222};
Line(2261) = {2222, 2219};
Line(2262) = {2222, 2221};
Line(2263) = {2221, 2220};
Line(2264) = {2208, 2224};
Line(2265) = {2207, 2223};
Line(2266) = {2206, 2222};
Line(2267) = {2205, 2221};

Line Loop(2268) = {2225, 2233, 2231, 2232};
Plane Surface(2201) = {2268};
Line Loop(2269) = {2226, 2234, 2230, -2233};
Plane Surface(2202) = {2269};
Line Loop(2270) = {2227, 2228, 2229, -2234};
Plane Surface(2203) = {2270};
Line Loop(2271) = {2235, 2236, 2237, -2225};
Plane Surface(2204) = {2271};
Line Loop(2272) = {-2237, 2239, 2240, -2226};
Plane Surface(2205) = {2272};
Line Loop(2273) = {-2240, 2248, 2242, -2227};
Plane Surface(2206) = {2273};
Line Loop(2274) = {2243, 2244, -2245, -2236};
Plane Surface(2207) = {2274};
Line Loop(2275) = {2245, 2246, -2247, -2239};
Plane Surface(2208) = {2275};
Line Loop(2276) = {-2247, 2248, 2249, 2241};
Plane Surface(2209) = {2276};
Line Loop(2277) = {2250, 2251, 2252, -2244};
Plane Surface(2210) = {2277};
Line Loop(2278) = {-2252, 2253, 2254, -2246};
Plane Surface(2211) = {2278};
Line Loop(2279) = {-2254, 2255, 2256, 2241};
Plane Surface(2212) = {2279};
Line Loop(2280) = {-2257, 2251, -2259, -2258};
Plane Surface(2213) = {2280};
Line Loop(2281) = {2259, 2253, -2261, -2260};
Plane Surface(2214) = {2281};
Line Loop(2282) = {2261, 2255, -2263, -2262};
Plane Surface(2215) = {2282};
Line Loop(2283) = {2264, 2258, -2265, 2231};
Plane Surface(2216) = {2283};
Line Loop(2284) = {2265, 2260, -2266, 2230};
Plane Surface(2217) = {2284};
Line Loop(2285) = {2266, 2262, -2267, 2229};
Plane Surface(2218) = {2285};
Line Loop(2286) = {2264, -2257, -2250, -2243, -2235, -2232};
Plane Surface(2219) = {2286};
Line Loop(2287) = {2267, 2263, 2256, -2249, 2242, 2228};
Plane Surface(2220) = {2287};



Surface Loop(22) = {2201, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2216, 2217, 2218, 2219, 2220};






/*IBOOM*/

Yaw = 0.06; //Iboom yaw angle (radians)

//Tripod hood (group 30)


Point(3000) = {SCrefx + segsep, SCrefy - SCdim/2 - 0.236, SCrefz - 0.044, Boomres};
Point(3001) = {SCrefx + segsep, SCrefy - SCdim/2 + 0.043 - 0.236, SCrefz - 0.044, Boomres};
Point(3002) = {SCrefx + segsep, SCrefy - SCdim/2 - 0.043 - 0.236, SCrefz - 0.044, Boomres};
Point(3003) = {SCrefx + segsep + 0.406, SCrefy - SCdim/2 + 0.043 - 0.236, SCrefz + 0.093 - 0.044, Boomres};
Point(3004) = {SCrefx + segsep + 0.406, SCrefy - SCdim/2 - 0.043 - 0.236, SCrefz + 0.093 - 0.044, Boomres};
Point(3005) = {SCrefx + segsep + 0.406, SCrefy - SCdim/2 + 0.043 + 0.037 - 0.236, SCrefz + 0.093 - 0.051 - 0.044, Boomres};
Point(3006) = {SCrefx + segsep + 0.406, SCrefy - SCdim/2 - 0.043 - 0.037 - 0.236, SCrefz + 0.093 - 0.051 - 0.044, Boomres};
Point(3007) = {SCrefx + segsep, SCrefy - SCdim/2 + 0.043 + 0.355*Cos(Atan(51/37)) - 0.236, SCrefz - 0.355*Sin(Atan(51/37)) - 0.044, Boomres};
Point(3008) = {SCrefx + segsep, SCrefy - SCdim/2 - 0.043 - 0.355*Cos(Atan(51/37)) - 0.236, SCrefz - 0.355*Sin(Atan(51/37)) - 0.044, Boomres};
Point(3009) = {SCrefx + segsep + 0.406, SCrefy - SCdim/2 + 0.043 + 0.037 - 0.236, SCrefz + 0.093 - 0.051 - 0.047 - 0.044, Boomres};
Point(3010) = {SCrefx + segsep + 0.406, SCrefy - SCdim/2 - 0.043 - 0.037 - 0.236, SCrefz + 0.093 - 0.051 - 0.047 - 0.044, Boomres};
Point(3011) = {SCrefx + segsep, SCrefy - SCdim/2 + 0.043 + 0.355*Cos(Atan(51/37)) - 0.236, SCrefz - 0.355*Sin(Atan(51/37)) - 0.047 - 0.044, Boomres};
Point(3012) = {SCrefx + segsep, SCrefy - SCdim/2 - 0.043 - 0.355*Cos(Atan(51/37)) - 0.236, SCrefz - 0.355*Sin(Atan(51/37)) - 0.047 - 0.044, Boomres};

Line(3031) = {3001, 3003};
Line(3032) = {3003, 3005};
Line(3033) = {3005, 3007};
Line(3034) = {3007, 3001};
Line(3035) = {3002, 3004};
Line(3036) = {3004, 3006};
Line(3037) = {3006, 3008};
Line(3038) = {3008, 3002};
Line(3039) = {3007, 3011};
Line(3040) = {3005, 3009};
Line(3041) = {3006, 3010};
Line(3042) = {3008, 3012};
Line(3043) = {3011, 3009};
Line(3044) = {3009, 3010};
Line(3045) = {3010, 3012};
Line(3046) = {3012, 3011};
Line(3047) = {3001, 3002};
Line(3048) = {3003, 3004};

Line Loop(3060) = {3043, 3044, 3045, 3046};
Line Loop(3061) = {3039, 3043, -3040, 3033};
Line Loop(3062) = {3034, 3031, 3032, 3033};
Line Loop(3063) = {3047, 3035, -3048, -3031};
Line Loop(3064) = {3038, 3035, 3036, 3037};
Line Loop(3065) = {3041, 3045, -3042, -3037};
Line Loop(3066) = {3047, -3038, 3042, 3046, -3039, 3034};
Line Loop(3067) = {3048, 3036, 3041, -3044, -3040, -3032};

Plane Surface(3080) = {3060};
Plane Surface(3081) = {3061};
Plane Surface(3082) = {3062};
Plane Surface(3083) = {3063};
Plane Surface(3084) = {3064};
Plane Surface(3085) = {3065};
Plane Surface(3086) = {3066};
Plane Surface(3087) = {3067};

Surface Loop(30) = {3080, 3081, 3082, 3083, 3084, 3085, 3086, 3087};

//Hinge 1 cone (group 31)

ConeSmallRadius1 = 0.055;
ConeMiddleRadius1 = 0.0665;
ConeLargeRadius1 = 0.078;
ConeLength1 = 0.14;


Point(3100) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233, SCrefz + 0.109, Coneres};
Point(3101) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233, SCrefz + 0.109 + ConeSmallRadius1, Coneres};
Point(3102) = {SCrefx + segsep + 0.471 + ConeSmallRadius1, SCrefy - SCdim/2 - 0.233, SCrefz + 0.109, Coneres};
Point(3103) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233, SCrefz + 0.109 - ConeSmallRadius1, Coneres};
Point(3104) = {SCrefx + segsep + 0.471 - ConeSmallRadius1, SCrefy - SCdim/2 - 0.233, SCrefz + 0.109, Coneres};

Point(3105) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1/2, SCrefz + 0.109, Coneres};
Point(3106) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1/2, SCrefz + 0.109 + ConeMiddleRadius1, Coneres};
Point(3107) = {SCrefx + segsep + 0.471 + ConeMiddleRadius1, SCrefy - SCdim/2 - 0.233 + ConeLength1/2, SCrefz + 0.109, Coneres};
Point(3108) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1/2, SCrefz + 0.109 - ConeMiddleRadius1, Coneres};
Point(3109) = {SCrefx + segsep + 0.471 - ConeMiddleRadius1, SCrefy - SCdim/2 - 0.233 + ConeLength1/2, SCrefz + 0.109, Coneres};

Point(3110) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109, Coneres};
Point(3111) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109 + ConeLargeRadius1, Coneres};
Point(3112) = {SCrefx + segsep + 0.471 + ConeLargeRadius1, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109, Coneres};
Point(3113) = {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109 - ConeLargeRadius1, Coneres};
Point(3114) = {SCrefx + segsep + 0.471 - ConeLargeRadius1, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109, Coneres};

Symmetry {0,1,0,0}{Point{3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3110, 3111, 3112, 3113, 3114};}
Translate{0, 0, -0.044}{Point{3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3110, 3111, 3112, 3113, 3114};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}{Point{3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3110, 3111, 3112, 3113, 3114};}

Circle(3130) = {3101, 3100, 3102};
Circle(3131) = {3102, 3100, 3103};
Circle(3132) = {3103, 3100, 3104};
Circle(3133) = {3104, 3100, 3101};

Circle(3134) = {3106, 3105, 3107};
Circle(3135) = {3107, 3105, 3108};
Circle(3136) = {3108, 3105, 3109};
Circle(3137) = {3109, 3105, 3106};

Line(3138) = {3101, 3106};
Line(3139) = {3102, 3107};
Line(3140) = {3103, 3108};
Line(3141) = {3104, 3109};

Circle(3142) = {3111, 3110, 3112};
Circle(3143) = {3112, 3110, 3113};
Circle(3144) = {3113, 3110, 3114};
Circle(3145) = {3114, 3110, 3111};

Line(3146) = {3106, 3111};
Line(3147) = {3107, 3112};
Line(3148) = {3108, 3113};
Line(3149) = {3109, 3114};

Line Loop(3160) = {3130, 3131, 3132, 3133};
Line Loop(3161) = {3142, 3143, 3144, 3145};
Line Loop(3162) = {3130, 3139, -3134, -3138};
Line Loop(3163) = {3131, 3140, -3135, -3139};
Line Loop(3164) = {3132, 3141, -3136, -3140};
Line Loop(3165) = {3133, 3138, -3137, -3141};
Line Loop(3166) = {3134, 3147, -3142, -3146};
Line Loop(3167) = {3135, 3148, -3143, -3147};
Line Loop(3168) = {3136, 3149, -3144, -3148};
Line Loop(3169) = {3137, 3146, -3145, -3149};

Plane Surface(3180) = {3160};
Plane Surface(3181) = {3161};
Ruled Surface(3182) = {3162};
Ruled Surface(3183) = {3163};
Ruled Surface(3184) = {3164};
Ruled Surface(3185) = {3165};
Ruled Surface(3186) = {3166};
Ruled Surface(3187) = {3167};
Ruled Surface(3188) = {3168};
Ruled Surface(3189) = {3169};

Surface Loop(31) = {3180, 3181, 3182, 3183, 3184, 3185, 3186, 3187, 3188, 3189};

//Hinge 1 Plate attached to tripod (group 33)

PlateSegmentTHeight = 0.114;
PlateSegmentTLength = 0.16;
PlateSegmentTThick = 0.02;
Plateres = Boomres;

PlateSegmentTRefX = SCrefx + segsep + 0.406 + segsep;
PlateSegmentTRefY = SCrefy - SCdim/2;
PlateSegmentTRefZ = SCrefz + 0.093 - 0.049;

Point(3300) = {PlateSegmentTRefX, PlateSegmentTRefY, PlateSegmentTRefZ};
Point(3301) = {PlateSegmentTRefX + PlateSegmentTThick, PlateSegmentTRefY - PlateSegmentTLength/2, PlateSegmentTRefZ + PlateSegmentTHeight/2, Plateres};
Point(3302) = {PlateSegmentTRefX + PlateSegmentTThick, PlateSegmentTRefY + PlateSegmentTLength/2, PlateSegmentTRefZ + PlateSegmentTHeight/2, Plateres};
Point(3303) = {PlateSegmentTRefX, PlateSegmentTRefY + PlateSegmentTLength/2, PlateSegmentTRefZ + PlateSegmentTHeight/2, Plateres};
Point(3304) = {PlateSegmentTRefX, PlateSegmentTRefY - PlateSegmentTLength/2, PlateSegmentTRefZ + PlateSegmentTHeight/2, Plateres};
Point(3305) = {PlateSegmentTRefX + PlateSegmentTThick, PlateSegmentTRefY - PlateSegmentTLength/2, PlateSegmentTRefZ- PlateSegmentTHeight/2, Plateres};
Point(3306) = {PlateSegmentTRefX + PlateSegmentTThick, PlateSegmentTRefY + PlateSegmentTLength/2, PlateSegmentTRefZ-PlateSegmentTHeight/2, Plateres};
Point(3307) = {PlateSegmentTRefX, PlateSegmentTRefY + PlateSegmentTLength/2, PlateSegmentTRefZ - PlateSegmentTHeight/2, Plateres};
Point(3308) = {PlateSegmentTRefX, PlateSegmentTRefY - PlateSegmentTLength/2, PlateSegmentTRefZ - PlateSegmentTHeight/2, Plateres};

Translate{0, 0, -0.044}{Point{3300, 3301, 3302, 3303, 3304, 3305, 3306, 3307, 3308};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}{Point{3300, 3301, 3302, 3303, 3304, 3305, 3306, 3307, 3308};}

Line(3330) = {3301, 3302};
Line(3331) = {3302, 3303};
Line(3332) = {3303, 3304};
Line(3333) = {3304, 3301};
Line(3334) = {3305, 3306};
Line(3335) = {3306, 3307};
Line(3336) = {3307, 3308};
Line(3337) = {3308, 3305};
Line(3338) = {3301, 3305};
Line(3339) = {3302, 3306};
Line(3340) = {3303, 3307};
Line(3341) = {3304, 3308};

Line Loop(3360) = {3330, 3331, 3332, 3333};
Line Loop(3361) = {3334, 3335, 3336, 3337};
Line Loop(3362) = {3333, 3338, -3337, -3341};
Line Loop(3363) = {3330, 3339, -3334, -3338};
Line Loop(3364) = {3339, 3335, -3340, -3331};
Line Loop(3365) = {3340, 3336, -3341, -3332};

Plane Surface(3380) = {3360};
Plane Surface(3381) = {3361};
Plane Surface(3382) = {3362};
Plane Surface(3383) = {3363};
Plane Surface(3384) = {3364};
Plane Surface(3385) = {3365};

Surface Loop(33) = {3380, 3381, 3382, 3383, 3384, 3385};

//Cylinder hinge 1 (Group 32)

Cylinder1Radius = 0.023;
Cylinder1Length = 0.16;


Point(3200) = {SCrefx + segsep + 0.471, PlateSegmentTRefY - PlateSegmentTLength/2, SCrefz + 0.109};
Point(3201) = {SCrefx + segsep + 0.471, PlateSegmentTRefY - PlateSegmentTLength/2, SCrefz + 0.109 + Cylinder1Radius, CylinderRes};
Point(3202) = {SCrefx + segsep + 0.471 + Cylinder1Radius, PlateSegmentTRefY - PlateSegmentTLength/2, SCrefz + 0.109, CylinderRes};
Point(3203) = {SCrefx + segsep + 0.471, PlateSegmentTRefY - PlateSegmentTLength/2, SCrefz + 0.109 - Cylinder1Radius, CylinderRes};
Point(3204) = {SCrefx + segsep + 0.471 - Cylinder1Radius, PlateSegmentTRefY - PlateSegmentTLength/2, SCrefz + 0.109, CylinderRes};

Point(3209) = {SCrefx + segsep + 0.471, PlateSegmentTRefY - PlateSegmentTLength/2 + Cylinder1Length, SCrefz + 0.109};
Point(3205) = {SCrefx + segsep + 0.471, PlateSegmentTRefY - PlateSegmentTLength/2 + Cylinder1Length, SCrefz + 0.109 + Cylinder1Radius, CylinderRes};
Point(3206) = {SCrefx + segsep + 0.471 + Cylinder1Radius, PlateSegmentTRefY - PlateSegmentTLength/2 + Cylinder1Length, SCrefz + 0.109, CylinderRes};
Point(3207) = {SCrefx + segsep + 0.471, PlateSegmentTRefY - PlateSegmentTLength/2 + Cylinder1Length, SCrefz + 0.109 - Cylinder1Radius, CylinderRes};
Point(3208) = {SCrefx + segsep + 0.471 - Cylinder1Radius, PlateSegmentTRefY - PlateSegmentTLength/2 + Cylinder1Length, SCrefz + 0.109, CylinderRes};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209};}
Translate{0, 0, -0.044}{Point{3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}{Point{3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209};}

Circle(3230) = {3201, 3200, 3202};
Circle(3231) = {3202, 3200, 3203};
Circle(3232) = {3203, 3200, 3204};
Circle(3233) = {3204, 3200, 3201};

Circle(3234) = {3205, 3209, 3206};
Circle(3235) = {3206, 3209, 3207};
Circle(3236) = {3207, 3209, 3208};
Circle(3237) = {3208, 3209, 3205};

Line(3238) = {3201, 3205};
Line(3239) = {3202, 3206};
Line(3240) = {3203, 3207};
Line(3241) = {3204, 3208};

Line Loop(3260) = {3230, 3231, 3232, 3233};
Line Loop(3261) = {3234, 3235, 3236, 3237};
Line Loop(3262) = {3230, 3239, -3234, -3238};
Line Loop(3263) = {3231, 3240, -3235, -3239};
Line Loop(3264) = {3232, 3241, -3236, -3240};
Line Loop(3265) = {3233, 3238, -3237, -3241};

Plane Surface(3280) = {3260};
Plane Surface(3281) = {3261};
Ruled Surface(3282) = {3262};
Ruled Surface(3283) = {3263};
Ruled Surface(3284) = {3264};
Ruled Surface(3285) = {3265};

Surface Loop(32) = {3280, 3281, 3282, 3283, 3283, 3284, 3285};

//Hinge 1 plate attached to boom segment 1 (group 34)

PlateSegment1Height = 0.18;
PlateSegment1Length = 0.16;
PlateSegment1Thick = 0.03;


PlateSegment1RefX = SCrefx + segsep + 0.406 + segsep + 0.110 - 0.02;
PlateSegment1RefY = SCrefy - SCdim/2;
PlateSegment1RefZ = SCrefz + 0.093 - 0.049;


Point(3400) = {PlateSegment1RefX, PlateSegment1RefY, PlateSegment1RefZ};
Point(3401) = {PlateSegment1RefX + PlateSegment1Thick, PlateSegment1RefY - PlateSegment1Length/2, PlateSegment1RefZ + PlateSegment1Height/2, Plateres};
Point(3402) = {PlateSegment1RefX + PlateSegment1Thick, PlateSegment1RefY + PlateSegment1Length/2, PlateSegment1RefZ + PlateSegment1Height/2, Plateres};
Point(3403) = {PlateSegment1RefX, PlateSegment1RefY + PlateSegment1Length/2, PlateSegment1RefZ + PlateSegment1Height/2, Plateres};
Point(3404) = {PlateSegment1RefX, PlateSegment1RefY - PlateSegment1Length/2, PlateSegment1RefZ + PlateSegment1Height/2, Plateres};
Point(3405) = {PlateSegment1RefX + PlateSegment1Thick, PlateSegment1RefY - PlateSegment1Length/2, PlateSegment1RefZ - PlateSegment1Height/2, Plateres};
Point(3406) = {PlateSegment1RefX + PlateSegment1Thick, PlateSegment1RefY + PlateSegment1Length/2, PlateSegment1RefZ - PlateSegment1Height/2, Plateres};
Point(3407) = {PlateSegment1RefX, PlateSegment1RefY + PlateSegment1Length/2, PlateSegment1RefZ - PlateSegment1Height/2, Plateres};
Point(3408) = {PlateSegment1RefX, PlateSegment1RefY - PlateSegment1Length/2, PlateSegment1RefZ - PlateSegment1Height/2, Plateres};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408};}
Translate{0, 0, -0.044}{Point{3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}{Point{3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408};}


Line(3430) = {3401, 3402};
Line(3431) = {3402, 3403};
Line(3432) = {3403, 3404};
Line(3433) = {3404, 3401};
Line(3434) = {3405, 3406};
Line(3435) = {3406, 3407};
Line(3436) = {3407, 3408};
Line(3437) = {3408, 3405};
Line(3438) = {3401, 3405};
Line(3439) = {3402, 3406};
Line(3440) = {3403, 3407};
Line(3441) = {3404, 3408};

Line Loop(3460) = {3430, 3431, 3432, 3433};
Line Loop(3461) = {3434, 3435, 3436, 3437};
Line Loop(3462) = {3433, 3438, -3437, -3441};
Line Loop(3463) = {3430, 3439, -3434, -3438};
Line Loop(3464) = {3439, 3435, -3440, -3431};
Line Loop(3465) = {3440, 3436, -3441, -3432};

Plane Surface(3480) = {3460};
Plane Surface(3481) = {3461};
Plane Surface(3482) = {3462};
Plane Surface(3483) = {3463};
Plane Surface(3484) = {3464};
Plane Surface(3485) = {3465};

Surface Loop(34) = {3480, 3481, 3482, 3483, 3483, 3484, 3485};


//Inner boom segment (Group 35)

BoomSegment1Length = 2.08617;
BoomSegment1Radius = 0.053;
//Boomres

BoomSegment1RefX = PlateSegment1RefX + PlateSegment1Thick + segsep;
BoomSegment1RefY = PlateSegment1RefY;
BoomSegment1RefZ = PlateSegment1RefZ;

Point(3500) = {BoomSegment1RefX, BoomSegment1RefY, BoomSegment1RefZ};
Point(3501) = {BoomSegment1RefX, BoomSegment1RefY, BoomSegment1RefZ + BoomSegment1Radius, Boomres};
Point(3502) = {BoomSegment1RefX, BoomSegment1RefY - BoomSegment1Radius, BoomSegment1RefZ, Boomres};
Point(3503) = {BoomSegment1RefX, BoomSegment1RefY, BoomSegment1RefZ - BoomSegment1Radius, Boomres};
Point(3504) = {BoomSegment1RefX, BoomSegment1RefY + BoomSegment1Radius, BoomSegment1RefZ, Boomres};

Point(3505) = {BoomSegment1RefX + BoomSegment1Length, BoomSegment1RefY, BoomSegment1RefZ + BoomSegment1Radius, Boomres};
Point(3506) = {BoomSegment1RefX + BoomSegment1Length, BoomSegment1RefY - BoomSegment1Radius, BoomSegment1RefZ, Boomres};
Point(3507) = {BoomSegment1RefX + BoomSegment1Length, BoomSegment1RefY, BoomSegment1RefZ - BoomSegment1Radius, Boomres};
Point(3508) = {BoomSegment1RefX + BoomSegment1Length, BoomSegment1RefY + BoomSegment1Radius, BoomSegment1RefZ, Boomres};
Point(3509) = {BoomSegment1RefX + BoomSegment1Length, BoomSegment1RefY, BoomSegment1RefZ};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3500, 3501, 3502, 3503, 3504, 3505, 3506, 3507, 3508, 3509};}
Translate{0, 0, -0.044}{Point{3500, 3501, 3502, 3503, 3504, 3505, 3506, 3507, 3508, 3509};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}{Point{3500, 3501, 3502, 3503, 3504, 3505, 3506, 3507, 3508, 3509};}


Circle(3530) = {3501, 3500, 3502};
Circle(3531) = {3502, 3500, 3503};
Circle(3532) = {3503, 3500, 3504};
Circle(3533) = {3504, 3500, 3501};

Circle(3534) = {3505, 3509, 3506};
Circle(3535) = {3506, 3509, 3507};
Circle(3536) = {3507, 3509, 3508};
Circle(3537) = {3508, 3509, 3505};

Line(3538) = {3501, 3505};
Line(3539) = {3502, 3506};
Line(3540) = {3503, 3507};
Line(3541) = {3504, 3508};

Line Loop(3560) = {3530, 3531, 3532, 3533};
Line Loop(3561) = {3534, 3535, 3536, 3537};
Line Loop(3562) = {3530, 3539, -3534, -3538};
Line Loop(3563) = {3531, 3540, -3535, -3539};
Line Loop(3564) = {3532, 3541, -3536, -3540};
Line Loop(3565) = {3533, 3538, -3537, -3541};

Plane Surface(3580) = {3560};
Plane Surface(3581) = {3561};
Ruled Surface(3582) = {3562};
Ruled Surface(3583) = {3563};
Ruled Surface(3584) = {3564};
Ruled Surface(3585) = {3565};

Surface Loop(35) = {3580, 3581, 3582, 3583, 3583, 3584, 3585};

//Hinge 2 plate attached to segment 1 (Group 36)

PlateSegment2Height = 0.16;
PlateSegment2Length = 0.067;
PlateSegment2Thick = 0.02;
Plateres = Boomres;

PlateSegment2RefX = BoomSegment1RefX + BoomSegment1Length + segsep;
PlateSegment2RefY = BoomSegment1RefY;
PlateSegment2refZ = BoomSegment1RefZ;

Point(3600) = {PlateSegment2RefX, PlateSegment2RefY, PlateSegment2refZ};
Point(3601) = {PlateSegment2RefX + PlateSegment2Thick, PlateSegment2RefY - PlateSegment2Length/2, PlateSegment2refZ + PlateSegment2Height/2, Plateres};
Point(3602) = {PlateSegment2RefX + PlateSegment2Thick, PlateSegment2RefY + PlateSegment2Length/2, PlateSegment2refZ + PlateSegment2Height/2, Plateres};
Point(3603) = {PlateSegment2RefX, PlateSegment2RefY + PlateSegment2Length/2, PlateSegment2refZ + PlateSegment2Height/2, Plateres};
Point(3604) = {PlateSegment2RefX, PlateSegment2RefY - PlateSegment2Length/2, PlateSegment2refZ + PlateSegment2Height/2, Plateres};
Point(3605) = {PlateSegment2RefX + PlateSegment2Thick, PlateSegment2RefY - PlateSegment2Length/2, PlateSegment2refZ - PlateSegment2Height/2, Plateres};
Point(3606) = {PlateSegment2RefX + PlateSegment2Thick, PlateSegment2RefY + PlateSegment2Length/2, PlateSegment2refZ - PlateSegment2Height/2, Plateres};
Point(3607) = {PlateSegment2RefX, PlateSegment2RefY + PlateSegment2Length/2, PlateSegment2refZ - PlateSegment2Height/2, Plateres};
Point(3608) = {PlateSegment2RefX, PlateSegment2RefY - PlateSegment2Length/2, PlateSegment2refZ - PlateSegment2Height/2, Plateres};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608};}
Translate{0, 0, -0.044}{Point{3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}{Point{3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608};}


Line(3630) = {3601, 3602};
Line(3631) = {3602, 3603};
Line(3632) = {3603, 3604};
Line(3633) = {3604, 3601};
Line(3634) = {3605, 3606};
Line(3635) = {3606, 3607};
Line(3636) = {3607, 3608};
Line(3637) = {3608, 3605};
Line(3638) = {3601, 3605};
Line(3639) = {3602, 3606};
Line(3640) = {3603, 3607};
Line(3641) = {3604, 3608};

Line Loop(3660) = {3630, 3631, 3632, 3633};
Line Loop(3661) = {3634, 3635, 3636, 3637};
Line Loop(3662) = {3633, 3638, -3637, -3641};
Line Loop(3663) = {3630, 3639, -3634, -3638};
Line Loop(3664) = {3639, 3635, -3640, -3631};
Line Loop(3665) = {3640, 3636, -3641, -3632};

Plane Surface(3680) = {3660};
Plane Surface(3681) = {3661};
Plane Surface(3682) = {3662};
Plane Surface(3683) = {3663};
Plane Surface(3684) = {3664};
Plane Surface(3685) = {3665};

Surface Loop(36) = {3680, 3681, 3682, 3683, 3683, 3684, 3685};

// Hinge 2 cone (group 37)

ConeSmallRadius2 = 0.0365;
ConeMiddleRadius2 = 0.047;
ConeLargeRadius2 = 0.0575;
ConeLength2 = 0.15;


Cone2RefX = PlateSegment2RefX + 0.055;
Cone2RefY = PlateSegment2RefY - 0.065;
Cone2RefZ = PlateSegment2refZ - 0.093 - ConeLength2;

Point(3700) = {Cone2RefX, Cone2RefY, Cone2RefZ, Coneres};
Point(3701) = {Cone2RefX, Cone2RefY - ConeSmallRadius2, Cone2RefZ, Coneres};
Point(3702) = {Cone2RefX + ConeSmallRadius2, Cone2RefY, Cone2RefZ, Coneres};
Point(3703) = {Cone2RefX, Cone2RefY + ConeSmallRadius2, Cone2RefZ, Coneres};
Point(3704) = {Cone2RefX - ConeSmallRadius2, Cone2RefY, Cone2RefZ, Coneres};

Point(3705) = {Cone2RefX, Cone2RefY, Cone2RefZ + ConeLength2/2, Coneres};
Point(3706) = {Cone2RefX, Cone2RefY - ConeMiddleRadius2, Cone2RefZ + ConeLength2/2, Coneres};
Point(3707) = {Cone2RefX + ConeMiddleRadius2, Cone2RefY, Cone2RefZ + ConeLength2/2, Coneres};
Point(3708) = {Cone2RefX, Cone2RefY + ConeMiddleRadius2, Cone2RefZ + ConeLength2/2, Coneres};
Point(3709) = {Cone2RefX - ConeMiddleRadius2, Cone2RefY, Cone2RefZ + ConeLength2/2, Coneres};

Point(3710) = {Cone2RefX, Cone2RefY, Cone2RefZ + ConeLength2, Coneres};
Point(3711) = {Cone2RefX, Cone2RefY - ConeLargeRadius2, Cone2RefZ + ConeLength2, Coneres};
Point(3712) = {Cone2RefX + ConeLargeRadius2, Cone2RefY, Cone2RefZ + ConeLength2, Coneres};
Point(3713) = {Cone2RefX, Cone2RefY + ConeLargeRadius2, Cone2RefZ + ConeLength2, Coneres};
Point(3714) = {Cone2RefX - ConeLargeRadius2, Cone2RefY, Cone2RefZ + ConeLength2, Coneres};


Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3700, 3701, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709, 3710, 3711, 3712, 3713, 3714};}
Translate{0, 0, -0.044} {Point{3700, 3701, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709, 3710, 3711, 3712, 3713, 3714};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw} {Point{3700, 3701, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709, 3710, 3711, 3712, 3713, 3714};}


Circle(3730) = {3701, 3700, 3702};
Circle(3731) = {3702, 3700, 3703};
Circle(3732) = {3703, 3700, 3704};
Circle(3733) = {3704, 3700, 3701};

Circle(3734) = {3706, 3705, 3707};
Circle(3735) = {3707, 3705, 3708};
Circle(3736) = {3708, 3705, 3709};
Circle(3737) = {3709, 3705, 3706};

Line(3738) = {3701, 3706};
Line(3739) = {3702, 3707};
Line(3740) = {3703, 3708};
Line(3741) = {3704, 3709};

Circle(3742) = {3711, 3710, 3712};
Circle(3743) = {3712, 3710, 3713};
Circle(3744) = {3713, 3710, 3714};
Circle(3745) = {3714, 3710, 3711};

Line(3746) = {3706, 3711};
Line(3747) = {3707, 3712};
Line(3748) = {3708, 3713};
Line(3749) = {3709, 3714};

Line Loop(3760) = {3730, 3731, 3732, 3733};
Line Loop(3761) = {3742, 3743, 3744, 3745};
Line Loop(3762) = {3730, 3739, -3734, -3738};
Line Loop(3763) = {3731, 3740, -3735, -3739};
Line Loop(3764) = {3732, 3741, -3736, -3740};
Line Loop(3765) = {3733, 3738, -3737, -3741};
Line Loop(3766) = {3734, 3747, -3742, -3746};
Line Loop(3767) = {3735, 3748, -3743, -3747};
Line Loop(3768) = {3736, 3749, -3744, -3748};
Line Loop(3769) = {3737, 3746, -3745, -3749};

Plane Surface(3780) = {3760};
Plane Surface(3781) = {3761};
Ruled Surface(3782) = {3762};
Ruled Surface(3783) = {3763};
Ruled Surface(3784) = {3764};
Ruled Surface(3785) = {3765};
Ruled Surface(3786) = {3766};
Ruled Surface(3787) = {3767};
Ruled Surface(3788) = {3768};
Ruled Surface(3789) = {3769};

Surface Loop(37) = {3780, 3781, 3782, 3783, 3783, 3784, 3785, 3786, 3787, 3788, 3789};

//Hinge 2 plate attached to outer segment (Group 39)

PlateSegmentOHeight = 0.16;
PlateSegmentOLength = 0.14;
PlateSegmentOThick = 0.03;


PlateSegmentORefX = BoomSegment1RefX + BoomSegment1Length + segsep + 0.1 - 0.02;
PlateSegmentORefY = BoomSegment1RefY;
PlateSegmentORefZ = BoomSegment1RefZ;

Point(3900) = {PlateSegmentORefX, PlateSegmentORefY, PlateSegmentORefZ};
Point(3901) = {PlateSegmentORefX + PlateSegmentOThick, PlateSegmentORefY - PlateSegmentOLength/2, PlateSegmentORefZ + PlateSegmentOHeight/2, Plateres};
Point(3902) = {PlateSegmentORefX + PlateSegmentOThick, PlateSegmentORefY + PlateSegmentOLength/2, PlateSegmentORefZ + PlateSegmentOHeight/2, Plateres};
Point(3903) = {PlateSegmentORefX, PlateSegmentORefY + PlateSegmentOLength/2, PlateSegmentORefZ + PlateSegmentOHeight/2, Plateres};
Point(3904) = {PlateSegmentORefX, PlateSegmentORefY - PlateSegmentOLength/2, PlateSegmentORefZ + PlateSegmentOHeight/2, Plateres};
Point(3905) = {PlateSegmentORefX + PlateSegmentOThick, PlateSegmentORefY - PlateSegmentOLength/2, PlateSegmentORefZ - PlateSegmentOHeight/2, Plateres};
Point(3906) = {PlateSegmentORefX + PlateSegmentOThick, PlateSegmentORefY + PlateSegmentOLength/2, PlateSegmentORefZ - PlateSegmentOHeight/2, Plateres};
Point(3907) = {PlateSegmentORefX, PlateSegmentORefY + PlateSegmentOLength/2, PlateSegmentORefZ - PlateSegmentOHeight/2, Plateres};
Point(3908) = {PlateSegmentORefX, PlateSegmentORefY - PlateSegmentOLength/2, PlateSegmentORefZ - PlateSegmentOHeight/2, Plateres};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3900, 3901, 3902, 3903, 3904, 3905, 3906, 3907, 3908};}
Translate{0, 0, -0.044}  {Point{3900, 3901, 3902, 3903, 3904, 3905, 3906, 3907, 3908};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}  {Point{3900, 3901, 3902, 3903, 3904, 3905, 3906, 3907, 3908};}


Line(3930) = {3901, 3902};
Line(3931) = {3902, 3903};
Line(3932) = {3903, 3904};
Line(3933) = {3904, 3901};
Line(3934) = {3905, 3906};
Line(3935) = {3906, 3907};
Line(3936) = {3907, 3908};
Line(3937) = {3908, 3905};
Line(3938) = {3901, 3905};
Line(3939) = {3902, 3906};
Line(3940) = {3903, 3907};
Line(3941) = {3904, 3908};

Line Loop(3960) = {3930, 3931, 3932, 3933};
Line Loop(3961) = {3934, 3935, 3936, 3937};
Line Loop(3962) = {3933, 3938, -3937, -3941};
Line Loop(3963) = {3930, 3939, -3934, -3938};
Line Loop(3964) = {3939, 3935, -3940, -3931};
Line Loop(3965) = {3940, 3936, -3941, -3932};

Plane Surface(3980) = {3960};
Plane Surface(3981) = {3961};
Plane Surface(3982) = {3962};
Plane Surface(3983) = {3963};
Plane Surface(3984) = {3964};
Plane Surface(3985) = {3965};

Surface Loop(39) = {3980, 3981, 3982, 3983, 3983, 3984, 3985};

//Boom segment 2 (Group 40)

BoomSegment2Length = 1.58402 - 0.02;
BoomSegment2Radius = 0.053;
//Boomres

BoomSegment2RefX = PlateSegmentORefX + PlateSegmentOThick + segsep;
BoomSegment2RefY = PlateSegmentORefY;
BoomSegment2RefZ = PlateSegmentORefZ;

Point(4000) = {BoomSegment2RefX, BoomSegment2RefY, BoomSegment2RefZ};
Point(4001) = {BoomSegment2RefX, BoomSegment2RefY, BoomSegment2RefZ + BoomSegment2Radius, Boomres};
Point(4002) = {BoomSegment2RefX, BoomSegment2RefY - BoomSegment2Radius, BoomSegment2RefZ, Boomres};
Point(4003) = {BoomSegment2RefX, BoomSegment2RefY, BoomSegment2RefZ - BoomSegment2Radius, Boomres};
Point(4004) = {BoomSegment2RefX, BoomSegment2RefY + BoomSegment2Radius, BoomSegment2RefZ, Boomres};
Point(4005) = {BoomSegment2RefX + BoomSegment2Length, BoomSegment2RefY, BoomSegment2RefZ + BoomSegment2Radius, Boomres};
Point(4006) = {BoomSegment2RefX + BoomSegment2Length, BoomSegment2RefY - BoomSegment2Radius, BoomSegment2RefZ, Boomres};
Point(4007) = {BoomSegment2RefX + BoomSegment2Length, BoomSegment2RefY, BoomSegment2RefZ - BoomSegment2Radius, Boomres};
Point(4008) = {BoomSegment2RefX + BoomSegment2Length, BoomSegment2RefY + BoomSegment2Radius, BoomSegment2RefZ, Boomres};
Point(4009) = {BoomSegment2RefX + BoomSegment2Length, BoomSegment2RefY, BoomSegment2RefZ};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{4000, 4001, 4002, 4003, 4004, 4005, 4006, 4007, 4008, 4009};}
Translate{0, 0, -0.044}  {Point{4000, 4001, 4002, 4003, 4004, 4005, 4006, 4007, 4008, 4009};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw}  {Point{4000, 4001, 4002, 4003, 4004, 4005, 4006, 4007, 4008, 4009};}

Circle(4030) = {4001, 4000, 4002};
Circle(4031) = {4002, 4000, 4003};
Circle(4032) = {4003, 4000, 4004};
Circle(4033) = {4004, 4000, 4001};

Circle(4034) = {4005, 4009, 4006};
Circle(4035) = {4006, 4009, 4007};
Circle(4036) = {4007, 4009, 4008};
Circle(4037) = {4008, 4009, 4005};

Line(4038) = {4001, 4005};
Line(4039) = {4002, 4006};
Line(4040) = {4003, 4007};
Line(4041) = {4004, 4008};

Line Loop(4060) = {4030, 4031, 4032, 4033};
Line Loop(4061) = {4034, 4035, 4036, 4037};
Line Loop(4062) = {4030, 4039, -4034, -4038};
Line Loop(4063) = {4031, 4040, -4035, -4039};
Line Loop(4064) = {4032, 4041, -4036, -4040};
Line Loop(4065) = {4033, 4038, -4037, -4041};

Plane Surface(4080) = {4060};
Plane Surface(4081) = {4061};
Ruled Surface(4082) = {4062};
Ruled Surface(4083) = {4063};
Ruled Surface(4084) = {4064};
Ruled Surface(4085) = {4065};

Surface Loop(40) = {4080, 4081, 4082, 4083, 4083, 4084, 4085};

//Hinge 2 Cylinder (Group 38)

Cylinder2Radius = 0.021;
Cylinder2Length = 0.16;
CylinderRes = Boomres;

zparam = 1.064;

Point(3800) = {Cone2RefX, Cone2RefY, zparam};
Point(3801) = {Cone2RefX, Cone2RefY - Cylinder2Radius,zparam, CylinderRes};
Point(3802) = {Cone2RefX + Cylinder2Radius, Cone2RefY, zparam, CylinderRes};
Point(3803) = {Cone2RefX, Cone2RefY + Cylinder2Radius, zparam, CylinderRes};
Point(3804) = {Cone2RefX - Cylinder2Radius, Cone2RefY, zparam, CylinderRes};

Point(3809) = {Cone2RefX, Cone2RefY, zparam + Cylinder2Length};
Point(3805) = {Cone2RefX, Cone2RefY - Cylinder2Radius, zparam + Cylinder2Length, CylinderRes};
Point(3806) = {Cone2RefX + Cylinder2Radius, Cone2RefY, zparam + Cylinder2Length, CylinderRes};
Point(3807) = {Cone2RefX, Cone2RefY + Cylinder2Radius, zparam + Cylinder2Length, CylinderRes};
Point(3808) = {Cone2RefX - Cylinder2Radius, Cone2RefY, zparam + Cylinder2Length, CylinderRes};

Rotate{{0, 1, 0}, {SCrefx + segsep + 0.471, SCrefy - SCdim/2 - 0.233 + ConeLength1, SCrefz + 0.109}, 0.279857} {Point{3800, 3801, 3802, 3803, 3804, 3805, 3806, 3807, 3808, 3809};}
Translate{0, 0, -0.044} {Point{3800, 3801, 3802, 3803, 3804, 3805, 3806, 3807, 3808, 3809};}
Rotate{{0,0,1},{3.246,0,-0.00779998}, Yaw} {Point{3800, 3801, 3802, 3803, 3804, 3805, 3806, 3807, 3808, 3809};}


Circle(3830) = {3801, 3800, 3802};
Circle(3831) = {3802, 3800, 3803};
Circle(3832) = {3803, 3800, 3804};
Circle(3833) = {3804, 3800, 3801};

Circle(3834) = {3805, 3809, 3806};
Circle(3835) = {3806, 3809, 3807};
Circle(3836) = {3807, 3809, 3808};
Circle(3837) = {3808, 3809, 3805};

Line(3838) = {3801, 3805};
Line(3839) = {3802, 3806};
Line(3840) = {3803, 3807};
Line(3841) = {3804, 3808};

Line Loop(3860) = {3830, 3831, 3832, 3833};
Line Loop(3861) = {3834, 3835, 3836, 3837};
Line Loop(3862) = {3830, 3839, -3834, -3838};
Line Loop(3863) = {3831, 3840, -3835, -3839};
Line Loop(3864) = {3832, 3841, -3836, -3840};
Line Loop(3865) = {3833, 3838, -3837, -3841};

Plane Surface(3880) = {3860};
Plane Surface(3881) = {3861};
Ruled Surface(3882) = {3862};
Ruled Surface(3883) = {3863};
Ruled Surface(3884) = {3864};
Ruled Surface(3885) = {3865};

Surface Loop(38) = {3880, 3881, 3882, 3883, 3883, 3884, 3885};

//EAS instrument suite (Group 41)

EASDeltaX = 4.201;
EASDeltaZ = 0.843655;
EASLongEdge = 0.2;
EASShortEdge = 0.0555;
EASLongLength = 0.18425;
EASShortLength = 0.11;


EASRefX = SCrefx + EASDeltaX;
EASRefY = SCrefy - SCdim/2;
EASRefZ =  SCrefz - 0.355*Sin(Atan(51/37)) - 0.047 - EASDeltaZ;
EASRadius = 0.0625;

Point(4100) = {EASRefX, EASRefY, EASRefZ, EASRes};
Point(4101) = {EASRefX + EASShortLength, EASRefY - EASLongEdge/2 , EASRefZ, EASRes};
Point(4102) = {EASRefX + EASLongLength, EASRefY - EASShortEdge/2 , EASRefZ, EASRes};
Point(4103) = {EASRefX + EASLongLength, EASRefY + EASShortEdge/2 , EASRefZ, EASRes};
Point(4104) = {EASRefX + EASShortLength, EASRefY + EASLongEdge/2 , EASRefZ, EASRes};
Point(4105) = {EASRefX, EASRefY + EASLongEdge/2, EASRefZ, EASRes};
Point(4106) = {EASRefX, EASRefY - EASLongEdge/2, EASRefZ, EASRes};

Line(4130) = {4101, 4102};
Line(4131) = {4102, 4103};
Line(4132) = {4103, 4104};
Line(4133) = {4104, 4105};
Line(4134) = {4105, 4106};
Line(4135) = {4106, 4101};

Line Loop(4160) = {4130, 4131, 4132, 4133, 4134, 4135};

Plane Surface(4180) = {4160};

Extrude{0, 0, -0.115}{Surface{4180};}
Delete{ Volume{1};}

Surface Loop(41) = {4180, 4191, 4195, 4199, 4203, 4207, 4211, 4212};

Offset = 0.005;
ScopeLength = 0.064;

Point(4125) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 + Offset, EASRefZ - 0.0575, EASRes};
Point(4126) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset + EASRadius,(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 + Offset, EASRefZ - 0.0575, EASRes};
Point(4127) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 + Offset, EASRefZ - 0.0575 + EASRadius, EASRes};
Point(4128) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset - EASRadius,(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 + Offset, EASRefZ - 0.0575, EASRes};
Point(4129) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 + Offset, EASRefZ - 0.0575 - EASRadius, EASRes};

Rotate{{0, 0, 1},{(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 + Offset, EASRefZ - 0.0575}, -0.785398} {Point{4126, 4127, 4128, 4129};}

Circle(4136) = {4126, 4125, 4127};
Circle(4137) = {4127, 4125, 4128};
Circle(4138) = {4128, 4125, 4129};
Circle(4139) = {4129, 4125, 4126};

Line Loop(4161) = {4136, 4137, 4138, 4139};

Plane Surface(4181) = {4161};

Extrude{0.70710678118*ScopeLength,0.70710678118*ScopeLength, 0}{Surface{4181};}
Delete{ Volume{1};}

Surface Loop(42) = {4181, 4221, 4225, 4229, 4233, 4234};

Point(4143) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,-(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 - Offset, EASRefZ - 0.0575, EASRes};
Point(4144) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset + EASRadius,-(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 - Offset, EASRefZ - 0.0575, EASRes};
Point(4145) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,-(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 - Offset, EASRefZ - 0.0575 + EASRadius, EASRes};
Point(4146) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset - EASRadius,-(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 - Offset, EASRefZ - 0.0575, EASRes};
Point(4147) = {(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,-(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 - Offset, EASRefZ - 0.0575 - EASRadius, EASRes};

Rotate{{0, 0, 1},{(EASRefX + EASLongLength + EASRefX + EASShortLength)/2 + Offset,-(EASRefY + EASShortEdge/2 + EASRefY + EASLongEdge/2)/2 - Offset, EASRefZ - 0.0575, EASRes}, 0.785398} {Point{4144, 4145, 4146, 4147};}

Circle(4140) = {4144, 4143, 4145};
Circle(4141) = {4145, 4143, 4146};
Circle(4142) = {4146, 4143, 4147};
Circle(4143) = {4147, 4143, 4144};

Line Loop(4162) = {4140, 4141, 4142, 4143};

Plane Surface(4182) = {4162};

Extrude{0.70710678118*ScopeLength,-0.70710678118*ScopeLength, 0}{Surface{4182};}
Delete{ Volume{1};}

Surface Loop(43) = {4182, 4243, 4247, 4251, 4255, 4256};


//Final transformations to be correct with CAD models and technical drawings

//Translate{0, 0, -0.044}{Point{3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3110, 3111, 3112, 3113, 3114, 3700, 3701, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709, 3710, 3711, 3712, 3713, 3714, 3300, 3301, 3302, 3303, 3304, 3305, 3306, 3307, 3308, 3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408, 3500, 3501, 3502, 3503, 3504, 3505, 3506, 3507, 3508, 3509, 3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3900, 3901, 3902, 3903, 3904, 3905, 3906, 3907, 3908, 4000, 4001, 4002, 4003, 4004, 4005, 4006, 4007, 4008, 4009, 3800, 3801, 3802, 3803, 3804, 3805, 3806, 3807, 3808, 3809};}



//Solar Array segments

ArraySegmentLength = 2.047;
HingeLength = 0.375;
HingeWidth = 0.0186;
HingeSep = 0.059;
HingeSpace = 0.040;
StripLength = 2;
StripWidth = 0.05;
StripSep = 0.02;
EdgeWidth = 0.006;


//Group 45

Segment45RefX = Ys22refx - Beamwidth;
Segment45RefY = SCrefy - SCdim - Yoketotallength + segsep - HingeSep;
Segment45RefZ = SCrefz - Yokeconn + Arraywidth/2;

Point(4501) = {Segment45RefX + Arraythickness, Segment45RefY, Segment45RefZ, Arrayres/5};
Point(4502) = {Segment45RefX, Segment45RefY, Segment45RefZ, Arrayres};
Point(4503) = {Segment45RefX, Segment45RefY - ArraySegmentLength, Segment45RefZ, Arrayres};
Point(4504) = {Segment45RefX + Arraythickness, Segment45RefY - ArraySegmentLength, Segment45RefZ, Arrayres/5};

Point(4505) = {Segment45RefX + Arraythickness, Segment45RefY, Segment45RefZ - Arraywidth, Arrayres/5};
Point(4506) = {Segment45RefX, Segment45RefY, Segment45RefZ - Arraywidth, Arrayres};
Point(4507) = {Segment45RefX, Segment45RefY - ArraySegmentLength, Segment45RefZ - Arraywidth, Arrayres};
Point(4508) = {Segment45RefX + Arraythickness, Segment45RefY - ArraySegmentLength, Segment45RefZ - Arraywidth, Arrayres/5};

Point(4509) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY - ArraySegmentLength/2 + StripLength/2, Segment45RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4510) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY - ArraySegmentLength/2 - StripLength/2, Segment45RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4511) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY - ArraySegmentLength/2 - StripLength/2, Segment45RefZ - Arraywidth + StripSep, Stripres};
Point(4512) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY - ArraySegmentLength/2 + StripLength/2, Segment45RefZ - Arraywidth + StripSep, Stripres};

Point(4513) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY, Segment45RefZ, Arrayres};
Point(4514) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY - ArraySegmentLength, Segment45RefZ, Arrayres};
Point(4515) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY - ArraySegmentLength, Segment45RefZ - Arraywidth, Arrayres};
Point(4516) = {Segment45RefX + Arraythickness + EdgeWidth, Segment45RefY, Segment45RefZ - Arraywidth, Arrayres};

Line(4530) = {4501, 4502};
Line(4531) = {4502, 4503};
Line(4532) = {4503, 4504};
Line(4533) = {4504, 4501};
Line(4534) = {4505, 4506};
Line(4535) = {4506, 4507};
Line(4536) = {4507, 4508};
Line(4537) = {4508, 4505};
Line(4538) = {4501, 4505};
Line(4539) = {4502, 4506};
Line(4540) = {4503, 4507};
Line(4541) = {4504, 4508};

Line(4551) = {4509, 4510};
Line(4552) = {4510, 4511};
Line(4553) = {4511, 4512};
Line(4554) = {4512, 4509};

Line(4555) = {4513, 4514};
Line(4556) = {4514, 4515};
Line(4557) = {4515, 4516};
Line(4558) = {4516, 4513};

Line(4559) = {4501, 4513};
Line(4560) = {4504, 4514};
Line(4561) = {4508, 4515};
Line(4562) = {4505, 4516};

Line Loop(4560) = {4530, 4531, 4532, 4533};
Line Loop(4561) = {4534, 4535, 4536, 4537};
Line Loop(4562) = {4530, 4539, -4534, -4538};
Line Loop(4563) = {4531, 4540, -4535, -4539};
Line Loop(4564) = {4532, 4541, -4536, -4540};
Line Loop(4565) = {4555, 4556, 4557, 4558};

Line Loop(4567) = {4555, -4560, 4533, 4559};
Line Loop(4568) = {4556, -4561, -4541, 4560};
Line Loop(4569) = {4557, -4562, -4537, 4561};
Line Loop(4570) = {4558, -4559, 4538, 4562};

Line Loop(4566) = {4551, 4552, 4553, 4554};
Plane Surface(4586) = {4566};

Plane Surface(4580) = {4560};
Plane Surface(4581) = {4561};
Plane Surface(4582) = {4562};
Plane Surface(4583) = {4563};
Plane Surface(4584) = {4564};
Plane Surface(4585) = {4565, 4566};

Plane Surface(4587) = {4567};
Plane Surface(4588) = {4568};
Plane Surface(4589) = {4569};
Plane Surface(4590) = {4570};

Surface Loop(45) = {4580, 4581, 4582, 4583, 4584, 4585, 4586, 4587, 4588, 4589, 4590};

//Group 46

Segment46RefX = Segment45RefX;
Segment46RefY = Segment45RefY - ArraySegmentLength - HingeSep;
Segment46RefZ = Segment45RefZ;

Point(4601) = {Segment46RefX + Arraythickness, Segment46RefY, Segment46RefZ, Arrayres/5};
Point(4602) = {Segment46RefX, Segment46RefY, Segment46RefZ, Arrayres};
Point(4603) = {Segment46RefX, Segment46RefY - ArraySegmentLength, Segment46RefZ, Arrayres};
Point(4604) = {Segment46RefX + Arraythickness, Segment46RefY - ArraySegmentLength, Segment46RefZ, Arrayres/5};

Point(4605) = {Segment46RefX + Arraythickness, Segment46RefY, Segment46RefZ - Arraywidth, Arrayres/5};
Point(4606) = {Segment46RefX, Segment46RefY, Segment46RefZ - Arraywidth, Arrayres};
Point(4607) = {Segment46RefX, Segment46RefY - ArraySegmentLength, Segment46RefZ - Arraywidth, Arrayres};
Point(4608) = {Segment46RefX + Arraythickness, Segment46RefY - ArraySegmentLength, Segment46RefZ - Arraywidth, Arrayres/5};

Point(4609) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY - ArraySegmentLength/2 + StripLength/2, Segment46RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4610) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY - ArraySegmentLength/2 - StripLength/2, Segment46RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4611) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY - ArraySegmentLength/2 - StripLength/2, Segment46RefZ - Arraywidth + StripSep, Stripres};
Point(4612) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY - ArraySegmentLength/2 + StripLength/2, Segment46RefZ - Arraywidth + StripSep, Stripres};

Point(4613) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY, Segment46RefZ, Arrayres};
Point(4614) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY - ArraySegmentLength, Segment46RefZ, Arrayres};
Point(4615) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY - ArraySegmentLength, Segment46RefZ - Arraywidth, Arrayres};
Point(4616) = {Segment46RefX + Arraythickness + EdgeWidth, Segment46RefY, Segment46RefZ - Arraywidth, Arrayres};

Line(4630) = {4601, 4602};
Line(4631) = {4602, 4603};
Line(4632) = {4603, 4604};
Line(4633) = {4604, 4601};
Line(4634) = {4605, 4606};
Line(4635) = {4606, 4607};
Line(4636) = {4607, 4608};
Line(4637) = {4608, 4605};
Line(4638) = {4601, 4605};
Line(4639) = {4602, 4606};
Line(4640) = {4603, 4607};
Line(4641) = {4604, 4608};

Line(4651) = {4609, 4610};
Line(4652) = {4610, 4611};
Line(4653) = {4611, 4612};
Line(4654) = {4612, 4609};

Line(4655) = {4613, 4614};
Line(4656) = {4614, 4615};
Line(4657) = {4615, 4616};
Line(4658) = {4616, 4613};

Line(4659) = {4601, 4613};
Line(4660) = {4604, 4614};
Line(4661) = {4608, 4615};
Line(4662) = {4605, 4616};

Line Loop(4660) = {4630, 4631, 4632, 4633};
Line Loop(4661) = {4634, 4635, 4636, 4637};
Line Loop(4662) = {4630, 4639, -4634, -4638};
Line Loop(4663) = {4631, 4640, -4635, -4639};
Line Loop(4664) = {4632, 4641, -4636, -4640};
Line Loop(4665) = {4655, 4656, 4657, 4658};

Line Loop(4667) = {4655, -4660, 4633, 4659};
Line Loop(4668) = {4656, -4661, -4641, 4660};
Line Loop(4669) = {4657, -4662, -4637, 4661};
Line Loop(4670) = {4658, -4659, 4638, 4662};

Line Loop(4666) = {4651, 4652, 4653, 4654};
Plane Surface(4686) = {4666};

Plane Surface(4680) = {4660};
Plane Surface(4681) = {4661};
Plane Surface(4682) = {4662};
Plane Surface(4683) = {4663};
Plane Surface(4684) = {4664};
Plane Surface(4685) = {4665, 4666};

Plane Surface(4687) = {4667};
Plane Surface(4688) = {4668};
Plane Surface(4689) = {4669};
Plane Surface(4690) = {4670};

Surface Loop(46) = {4680, 4681, 4682, 4683, 4684, 4685, 4686, 4687, 4688, 4689, 4690};

//Group 47

Segment47RefX = Segment46RefX;
Segment47RefY = Segment46RefY - ArraySegmentLength - HingeSep;
Segment47RefZ = Segment46RefZ;


Point(4701) = {Segment47RefX + Arraythickness, Segment47RefY, Segment47RefZ, Arrayres/5};
Point(4702) = {Segment47RefX, Segment47RefY, Segment47RefZ, Arrayres};
Point(4703) = {Segment47RefX, Segment47RefY - ArraySegmentLength, Segment47RefZ, Arrayres};
Point(4704) = {Segment47RefX + Arraythickness, Segment47RefY - ArraySegmentLength, Segment47RefZ, Arrayres/5};

Point(4705) = {Segment47RefX + Arraythickness, Segment47RefY, Segment47RefZ - Arraywidth, Arrayres/5};
Point(4706) = {Segment47RefX, Segment47RefY, Segment47RefZ - Arraywidth, Arrayres};
Point(4707) = {Segment47RefX, Segment47RefY - ArraySegmentLength, Segment47RefZ - Arraywidth, Arrayres};
Point(4708) = {Segment47RefX + Arraythickness, Segment47RefY - ArraySegmentLength, Segment47RefZ - Arraywidth, Arrayres/5};

Point(4709) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY - ArraySegmentLength/2 + StripLength/2, Segment47RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4710) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY - ArraySegmentLength/2 - StripLength/2, Segment47RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4711) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY - ArraySegmentLength/2 - StripLength/2, Segment47RefZ - Arraywidth + StripSep, Stripres};
Point(4712) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY - ArraySegmentLength/2 + StripLength/2, Segment47RefZ - Arraywidth + StripSep, Stripres};

Point(4713) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY, Segment47RefZ, Arrayres};
Point(4714) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY - ArraySegmentLength, Segment47RefZ, Arrayres};
Point(4715) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY - ArraySegmentLength, Segment47RefZ - Arraywidth, Arrayres};
Point(4716) = {Segment47RefX + Arraythickness + EdgeWidth, Segment47RefY, Segment47RefZ - Arraywidth, Arrayres};

Line(4730) = {4701, 4702};
Line(4731) = {4702, 4703};
Line(4732) = {4703, 4704};
Line(4733) = {4704, 4701};
Line(4734) = {4705, 4706};
Line(4735) = {4706, 4707};
Line(4736) = {4707, 4708};
Line(4737) = {4708, 4705};
Line(4738) = {4701, 4705};
Line(4739) = {4702, 4706};
Line(4740) = {4703, 4707};
Line(4741) = {4704, 4708};

Line(4751) = {4709, 4710};
Line(4752) = {4710, 4711};
Line(4753) = {4711, 4712};
Line(4754) = {4712, 4709};

Line(4755) = {4713, 4714};
Line(4756) = {4714, 4715};
Line(4757) = {4715, 4716};
Line(4758) = {4716, 4713};

Line(4759) = {4701, 4713};
Line(4760) = {4704, 4714};
Line(4761) = {4708, 4715};
Line(4762) = {4705, 4716};

Line Loop(4760) = {4730, 4731, 4732, 4733};
Line Loop(4761) = {4734, 4735, 4736, 4737};
Line Loop(4762) = {4730, 4739, -4734, -4738};
Line Loop(4763) = {4731, 4740, -4735, -4739};
Line Loop(4764) = {4732, 4741, -4736, -4740};
Line Loop(4765) = {4755, 4756, 4757, 4758};

Line Loop(4767) = {4755, -4760, 4733, 4759};
Line Loop(4768) = {4756, -4761, -4741, 4760};
Line Loop(4769) = {4757, -4762, -4737, 4761};
Line Loop(4770) = {4758, -4759, 4738, 4762};

Line Loop(4766) = {4751, 4752, 4753, 4754};
Plane Surface(4786) = {4766};

Plane Surface(4780) = {4760};
Plane Surface(4781) = {4761};
Plane Surface(4782) = {4762};
Plane Surface(4783) = {4763};
Plane Surface(4784) = {4764};
Plane Surface(4785) = {4765, 4766};

Plane Surface(4787) = {4767};
Plane Surface(4788) = {4768};
Plane Surface(4789) = {4769};
Plane Surface(4790) = {4770};

Surface Loop(47) = {4780, 4781, 4782, 4783, 4784, 4785, 4786, 4787, 4788, 4789, 4790};

//Group 48

Segment48RefX = Ys13refx - Arraythickness;
Segment48RefY = Ys13refy + HingeSep + ArraySegmentLength;
Segment48RefZ = Ys13refz;


Point(4801) = {Segment48RefX + Arraythickness, Segment48RefY, Segment48RefZ, Arrayres/5};
Point(4802) = {Segment48RefX, Segment48RefY, Segment48RefZ, Arrayres};
Point(4803) = {Segment48RefX, Segment48RefY - ArraySegmentLength, Segment48RefZ, Arrayres};
Point(4804) = {Segment48RefX + Arraythickness, Segment48RefY - ArraySegmentLength, Segment48RefZ, Arrayres/5};

Point(4805) = {Segment48RefX + Arraythickness, Segment48RefY, Segment48RefZ - Arraywidth, Arrayres/5};
Point(4806) = {Segment48RefX, Segment48RefY, Segment48RefZ - Arraywidth, Arrayres};
Point(4807) = {Segment48RefX, Segment48RefY - ArraySegmentLength, Segment48RefZ - Arraywidth, Arrayres};
Point(4808) = {Segment48RefX + Arraythickness, Segment48RefY - ArraySegmentLength, Segment48RefZ - Arraywidth, Arrayres/5};

Point(4809) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY - ArraySegmentLength/2 + StripLength/2, Segment48RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4810) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY - ArraySegmentLength/2 - StripLength/2, Segment48RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4811) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY - ArraySegmentLength/2 - StripLength/2, Segment48RefZ - Arraywidth + StripSep, Stripres};
Point(4812) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY - ArraySegmentLength/2 + StripLength/2, Segment48RefZ - Arraywidth + StripSep, Stripres};

Point(4813) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY, Segment48RefZ, Arrayres};
Point(4814) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY - ArraySegmentLength, Segment48RefZ, Arrayres};
Point(4815) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY - ArraySegmentLength, Segment48RefZ - Arraywidth, Arrayres};
Point(4816) = {Segment48RefX + Arraythickness + EdgeWidth, Segment48RefY, Segment48RefZ - Arraywidth, Arrayres};

Line(4830) = {4801, 4802};
Line(4831) = {4802, 4803};
Line(4832) = {4803, 4804};
Line(4833) = {4804, 4801};
Line(4834) = {4805, 4806};
Line(4835) = {4806, 4807};
Line(4836) = {4807, 4808};
Line(4837) = {4808, 4805};
Line(4838) = {4801, 4805};
Line(4839) = {4802, 4806};
Line(4840) = {4803, 4807};
Line(4841) = {4804, 4808};

Line(4851) = {4809, 4810};
Line(4852) = {4810, 4811};
Line(4853) = {4811, 4812};
Line(4854) = {4812, 4809};

Line(4855) = {4813, 4814};
Line(4856) = {4814, 4815};
Line(4857) = {4815, 4816};
Line(4858) = {4816, 4813};

Line(4859) = {4801, 4813};
Line(4860) = {4804, 4814};
Line(4861) = {4808, 4815};
Line(4862) = {4805, 4816};

Line Loop(4860) = {4830, 4831, 4832, 4833};
Line Loop(4861) = {4834, 4835, 4836, 4837};
Line Loop(4862) = {4830, 4839, -4834, -4838};
Line Loop(4863) = {4831, 4840, -4835, -4839};
Line Loop(4864) = {4832, 4841, -4836, -4840};
Line Loop(4865) = {4855, 4856, 4857, 4858};

Line Loop(4867) = {4855, -4860, 4833, 4859};
Line Loop(4868) = {4856, -4861, -4841, 4860};
Line Loop(4869) = {4857, -4862, -4837, 4861};
Line Loop(4870) = {4858, -4859, 4838, 4862};

Line Loop(4866) = {4851, 4852, 4853, 4854};
Plane Surface(4886) = {4866};

Plane Surface(4880) = {4860};
Plane Surface(4881) = {4861};
Plane Surface(4882) = {4862};
Plane Surface(4883) = {4863};
Plane Surface(4884) = {4864};
Plane Surface(4885) = {4865, 4866};

Plane Surface(4887) = {4867};
Plane Surface(4888) = {4868};
Plane Surface(4889) = {4869};
Plane Surface(4890) = {4870};

Surface Loop(48) = {4880, 4881, 4882, 4883, 4884, 4885, 4886, 4887, 4888, 4889, 4890};

//Group 49

Segment49RefX = Segment48RefX;
Segment49RefY = Segment48RefY + ArraySegmentLength + HingeSep;
Segment49RefZ = Segment48RefZ;


Point(4901) = {Segment49RefX + Arraythickness, Segment49RefY, Segment49RefZ, Arrayres/5};
Point(4902) = {Segment49RefX, Segment49RefY, Segment49RefZ, Arrayres};
Point(4903) = {Segment49RefX, Segment49RefY - ArraySegmentLength, Segment49RefZ, Arrayres};
Point(4904) = {Segment49RefX + Arraythickness, Segment49RefY - ArraySegmentLength, Segment49RefZ, Arrayres/5};

Point(4905) = {Segment49RefX + Arraythickness, Segment49RefY, Segment49RefZ - Arraywidth, Arrayres/5};
Point(4906) = {Segment49RefX, Segment49RefY, Segment49RefZ - Arraywidth, Arrayres};
Point(4907) = {Segment49RefX, Segment49RefY - ArraySegmentLength, Segment49RefZ - Arraywidth, Arrayres};
Point(4908) = {Segment49RefX + Arraythickness, Segment49RefY - ArraySegmentLength, Segment49RefZ - Arraywidth, Arrayres/5};

Point(4909) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY - ArraySegmentLength/2 + StripLength/2, Segment49RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4910) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY - ArraySegmentLength/2 - StripLength/2, Segment49RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(4911) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY - ArraySegmentLength/2 - StripLength/2, Segment49RefZ - Arraywidth + StripSep, Stripres};
Point(4912) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY - ArraySegmentLength/2 + StripLength/2, Segment49RefZ - Arraywidth + StripSep, Stripres};

Point(4913) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY, Segment49RefZ, Arrayres};
Point(4914) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY - ArraySegmentLength, Segment49RefZ, Arrayres};
Point(4915) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY - ArraySegmentLength, Segment49RefZ - Arraywidth, Arrayres};
Point(4916) = {Segment49RefX + Arraythickness + EdgeWidth, Segment49RefY, Segment49RefZ - Arraywidth, Arrayres};

Line(4930) = {4901, 4902};
Line(4931) = {4902, 4903};
Line(4932) = {4903, 4904};
Line(4933) = {4904, 4901};
Line(4934) = {4905, 4906};
Line(4935) = {4906, 4907};
Line(4936) = {4907, 4908};
Line(4937) = {4908, 4905};
Line(4938) = {4901, 4905};
Line(4939) = {4902, 4906};
Line(4940) = {4903, 4907};
Line(4941) = {4904, 4908};

Line(4951) = {4909, 4910};
Line(4952) = {4910, 4911};
Line(4953) = {4911, 4912};
Line(4954) = {4912, 4909};

Line(4955) = {4913, 4914};
Line(4956) = {4914, 4915};
Line(4957) = {4915, 4916};
Line(4958) = {4916, 4913};

Line(4959) = {4901, 4913};
Line(4960) = {4904, 4914};
Line(4961) = {4908, 4915};
Line(4962) = {4905, 4916};

Line Loop(4960) = {4930, 4931, 4932, 4933};
Line Loop(4961) = {4934, 4935, 4936, 4937};
Line Loop(4962) = {4930, 4939, -4934, -4938};
Line Loop(4963) = {4931, 4940, -4935, -4939};
Line Loop(4964) = {4932, 4941, -4936, -4940};
Line Loop(4965) = {4955, 4956, 4957, 4958};

Line Loop(4967) = {4955, -4960, 4933, 4959};
Line Loop(4968) = {4956, -4961, -4941, 4960};
Line Loop(4969) = {4957, -4962, -4937, 4961};
Line Loop(4970) = {4958, -4959, 4938, 4962};

Line Loop(4966) = {4951, 4952, 4953, 4954};
Plane Surface(4986) = {4966};

Plane Surface(4980) = {4960};
Plane Surface(4981) = {4961};
Plane Surface(4982) = {4962};
Plane Surface(4983) = {4963};
Plane Surface(4984) = {4964};
Plane Surface(4985) = {4965, 4966};

Plane Surface(4987) = {4967};
Plane Surface(4988) = {4968};
Plane Surface(4989) = {4969};
Plane Surface(4990) = {4970};

Surface Loop(49) = {4980, 4981, 4982, 4983, 4984, 4985, 4986, 4987, 4988, 4989, 4990};

//Group 50

Segment50RefX = Segment49RefX;
Segment50RefY = Segment49RefY + ArraySegmentLength + HingeSep;
Segment50RefZ = Segment49RefZ;


Point(5001) = {Segment50RefX + Arraythickness, Segment50RefY, Segment50RefZ, Arrayres/5};
Point(5002) = {Segment50RefX, Segment50RefY, Segment50RefZ, Arrayres};
Point(5003) = {Segment50RefX, Segment50RefY - ArraySegmentLength, Segment50RefZ, Arrayres};
Point(5004) = {Segment50RefX + Arraythickness, Segment50RefY - ArraySegmentLength, Segment50RefZ, Arrayres/5};

Point(5005) = {Segment50RefX + Arraythickness, Segment50RefY, Segment50RefZ - Arraywidth, Arrayres/5};
Point(5006) = {Segment50RefX, Segment50RefY, Segment50RefZ - Arraywidth, Arrayres};
Point(5007) = {Segment50RefX, Segment50RefY - ArraySegmentLength, Segment50RefZ - Arraywidth, Arrayres};
Point(5008) = {Segment50RefX + Arraythickness, Segment50RefY - ArraySegmentLength, Segment50RefZ - Arraywidth, Arrayres/5};

Point(5009) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY - ArraySegmentLength/2 + StripLength/2, Segment50RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(5010) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY - ArraySegmentLength/2 - StripLength/2, Segment50RefZ - Arraywidth + StripSep + StripWidth, Stripres};
Point(5011) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY - ArraySegmentLength/2 - StripLength/2, Segment50RefZ - Arraywidth + StripSep, Stripres};
Point(5012) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY - ArraySegmentLength/2 + StripLength/2, Segment50RefZ - Arraywidth + StripSep, Stripres};

Point(5013) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY, Segment50RefZ, Arrayres};
Point(5014) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY - ArraySegmentLength, Segment50RefZ, Arrayres};
Point(5015) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY - ArraySegmentLength, Segment50RefZ - Arraywidth, Arrayres};
Point(5016) = {Segment50RefX + Arraythickness + EdgeWidth, Segment50RefY, Segment50RefZ - Arraywidth, Arrayres};

Line(5030) = {5001, 5002};
Line(5031) = {5002, 5003};
Line(5032) = {5003, 5004};
Line(5033) = {5004, 5001};
Line(5034) = {5005, 5006};
Line(5035) = {5006, 5007};
Line(5036) = {5007, 5008};
Line(5037) = {5008, 5005};
Line(5038) = {5001, 5005};
Line(5039) = {5002, 5006};
Line(5040) = {5003, 5007};
Line(5041) = {5004, 5008};

Line(5051) = {5009, 5010};
Line(5052) = {5010, 5011};
Line(5053) = {5011, 5012};
Line(5054) = {5012, 5009};

Line(5055) = {5013, 5014};
Line(5056) = {5014, 5015};
Line(5057) = {5015, 5016};
Line(5058) = {5016, 5013};

Line(5059) = {5001, 5013};
Line(5060) = {5004, 5014};
Line(5061) = {5008, 5015};
Line(5062) = {5005, 5016};

Line Loop(5060) = {5030, 5031, 5032, 5033};
Line Loop(5061) = {5034, 5035, 5036, 5037};
Line Loop(5062) = {5030, 5039, -5034, -5038};
Line Loop(5063) = {5031, 5040, -5035, -5039};
Line Loop(5064) = {5032, 5041, -5036, -5040};
Line Loop(5065) = {5055, 5056, 5057, 5058};

Line Loop(5067) = {5055, -5060, 5033, 5059};
Line Loop(5068) = {5056, -5061, -5041, 5060};
Line Loop(5069) = {5057, -5062, -5037, 5061};
Line Loop(5070) = {5058, -5059, 5038, 5062};

Line Loop(5066) = {5051, 5052, 5053, 5054};
Plane Surface(5086) = {5066};

Plane Surface(5080) = {5060};
Plane Surface(5081) = {5061};
Plane Surface(5082) = {5062};
Plane Surface(5083) = {5063};
Plane Surface(5084) = {5064};
Plane Surface(5085) = {5065, 5066};

Plane Surface(5087) = {5067};
Plane Surface(5088) = {5068};
Plane Surface(5089) = {5069};
Plane Surface(5090) = {5070};

Surface Loop(50) = {5080, 5081, 5082, 5083, 5084, 5085, 5086, 5087, 5088, 5089, 5090};

//Hinges

//Group 51

Hinge51RefX = Segment45RefX + Arraythickness;
Hinge51RefY = Segment45RefY + HingeSep/2 + HingeWidth/2;
Hinge51RefZ = Segment45RefZ - HingeSpace;

Point(5101) = {Hinge51RefX, Hinge51RefY, Hinge51RefZ, HingeRes};
Point(5102) = {Hinge51RefX - Arraythickness, Hinge51RefY, Hinge51RefZ, HingeRes};
Point(5103) = {Hinge51RefX - Arraythickness, Hinge51RefY - HingeWidth, Hinge51RefZ, HingeRes};
Point(5104) = {Hinge51RefX, Hinge51RefY - HingeWidth, Hinge51RefZ, HingeRes};

Point(5105) = {Hinge51RefX, Hinge51RefY, Hinge51RefZ - HingeLength, HingeRes};
Point(5106) = {Hinge51RefX - Arraythickness, Hinge51RefY, Hinge51RefZ - HingeLength, HingeRes};
Point(5107) = {Hinge51RefX - Arraythickness, Hinge51RefY - HingeWidth, Hinge51RefZ - HingeLength, HingeRes};
Point(5108) = {Hinge51RefX, Hinge51RefY - HingeWidth, Hinge51RefZ - HingeLength, HingeRes};

Line(5130) = {5101, 5102};
Line(5131) = {5102, 5103};
Line(5132) = {5103, 5104};
Line(5133) = {5104, 5101};
Line(5134) = {5105, 5106};
Line(5135) = {5106, 5107};
Line(5136) = {5107, 5108};
Line(5137) = {5108, 5105};
Line(5138) = {5101, 5105};
Line(5139) = {5102, 5106};
Line(5140) = {5103, 5107};
Line(5141) = {5104, 5108};

Line Loop(5160) = {5130, 5131, 5132, 5133};
Line Loop(5161) = {5134, 5135, 5136, 5137};
Line Loop(5162) = {5130, 5139, -5134, -5138};
Line Loop(5163) = {5131, 5140, -5135, -5139};
Line Loop(5164) = {5132, 5141, -5136, -5140};
Line Loop(5165) = {5133, 5138, -5137, -5141};

Plane Surface(5180) = {5160};
Plane Surface(5181) = {5161};
Plane Surface(5182) = {5162};
Plane Surface(5183) = {5163};
Plane Surface(5184) = {5164};
Plane Surface(5185) = {5165};

Surface Loop(51) = {5180, 5181, 5182, 5183, 5184, 5185};

//Group 52

Hinge52RefX = Segment45RefX + Arraythickness;
Hinge52RefY = Segment45RefY + HingeSep/2 + HingeWidth/2;
Hinge52RefZ = Segment45RefZ - Arraywidth + HingeSpace + HingeLength;

Point(5201) = {Hinge52RefX, Hinge52RefY, Hinge52RefZ, HingeRes};
Point(5202) = {Hinge52RefX - Arraythickness, Hinge52RefY, Hinge52RefZ, HingeRes};
Point(5203) = {Hinge52RefX - Arraythickness, Hinge52RefY - HingeWidth, Hinge52RefZ, HingeRes};
Point(5204) = {Hinge52RefX, Hinge52RefY - HingeWidth, Hinge52RefZ, HingeRes};

Point(5205) = {Hinge52RefX, Hinge52RefY, Hinge52RefZ - HingeLength, HingeRes};
Point(5206) = {Hinge52RefX - Arraythickness, Hinge52RefY, Hinge52RefZ - HingeLength, HingeRes};
Point(5207) = {Hinge52RefX - Arraythickness, Hinge52RefY - HingeWidth, Hinge52RefZ - HingeLength, HingeRes};
Point(5208) = {Hinge52RefX, Hinge52RefY - HingeWidth, Hinge52RefZ - HingeLength, HingeRes};

Point(5209) = {Hinge52RefX - Arraythickness, Hinge52RefY, Hinge52RefZ - HingeLength/2, HingeRes};
Point(5210) = {Hinge52RefX - Arraythickness, Hinge52RefY - HingeWidth, Hinge52RefZ - HingeLength/2, HingeRes};

Line(5230) = {5201, 5202};
Line(5231) = {5202, 5203};
Line(5232) = {5203, 5204};
Line(5233) = {5204, 5201};
Line(5234) = {5205, 5206};
Line(5235) = {5206, 5207};
Line(5236) = {5207, 5208};
Line(5237) = {5208, 5205};
Line(5238) = {5201, 5205};

Line(5239) = {5202, 5209};
Line(5240) = {5203, 5210};

Line(5241) = {5204, 5208};

Line(5242) = {5209, 5210};
Line(5243) = {5209, 5206};
Line(5244) = {5210, 5207};

Line Loop(5260) = {5230, 5231, 5232, 5233};
Line Loop(5261) = {5234, 5235, 5236, 5237};
Line Loop(5262) = {5230, 5239, 5243, -5234, -5238};
Line Loop(5263) = {5231, 5240, -5242, -5239};
Line Loop(5264) = {5232, 5241, -5236, -5244, -5240};
Line Loop(5265) = {5233, 5238, -5237, -5241};
Line Loop(5266) = {5242, 5244, -5235, -5243};

Plane Surface(5280) = {5260};
Plane Surface(5281) = {5261};
Plane Surface(5282) = {5262};
Plane Surface(5283) = {5263};
Plane Surface(5284) = {5264};
Plane Surface(5285) = {5265};
Plane Surface(5286) = {5266};

Surface Loop(52) = {5280, 5281, 5282, 5283, 5284, 5285, 5286};

//Group 53

Hinge53RefX = Segment46RefX + Arraythickness;
Hinge53RefY = Segment46RefY + HingeSep/2 + HingeWidth/2;
Hinge53RefZ = Segment46RefZ - HingeSpace;

Point(5301) = {Hinge53RefX, Hinge53RefY, Hinge53RefZ, HingeRes};
Point(5302) = {Hinge53RefX - Arraythickness, Hinge53RefY, Hinge53RefZ, HingeRes};
Point(5303) = {Hinge53RefX - Arraythickness, Hinge53RefY - HingeWidth, Hinge53RefZ, HingeRes};
Point(5304) = {Hinge53RefX, Hinge53RefY - HingeWidth, Hinge53RefZ, HingeRes};

Point(5305) = {Hinge53RefX, Hinge53RefY, Hinge53RefZ - HingeLength, HingeRes};
Point(5306) = {Hinge53RefX - Arraythickness, Hinge53RefY, Hinge53RefZ - HingeLength, HingeRes};
Point(5307) = {Hinge53RefX - Arraythickness, Hinge53RefY - HingeWidth, Hinge53RefZ - HingeLength, HingeRes};
Point(5308) = {Hinge53RefX, Hinge53RefY - HingeWidth, Hinge53RefZ - HingeLength, HingeRes};

Line(5330) = {5301, 5302};
Line(5331) = {5302, 5303};
Line(5332) = {5303, 5304};
Line(5333) = {5304, 5301};
Line(5334) = {5305, 5306};
Line(5335) = {5306, 5307};
Line(5336) = {5307, 5308};
Line(5337) = {5308, 5305};
Line(5338) = {5301, 5305};
Line(5339) = {5302, 5306};
Line(5340) = {5303, 5307};
Line(5341) = {5304, 5308};

Line Loop(5360) = {5330, 5331, 5332, 5333};
Line Loop(5361) = {5334, 5335, 5336, 5337};
Line Loop(5362) = {5330, 5339, -5334, -5338};
Line Loop(5363) = {5331, 5340, -5335, -5339};
Line Loop(5364) = {5332, 5341, -5336, -5340};
Line Loop(5365) = {5333, 5338, -5337, -5341};

Plane Surface(5380) = {5360};
Plane Surface(5381) = {5361};
Plane Surface(5382) = {5362};
Plane Surface(5383) = {5363};
Plane Surface(5384) = {5364};
Plane Surface(5385) = {5365};

Surface Loop(53) = {5380, 5381, 5382, 5383, 5384, 5385};

//Group 54

Hinge54RefX = Segment46RefX + Arraythickness;
Hinge54RefY = Segment46RefY + HingeSep/2 + HingeWidth/2;
Hinge54RefZ = Segment46RefZ - Arraywidth + HingeSpace + HingeLength;

Point(5401) = {Hinge54RefX, Hinge54RefY, Hinge54RefZ, HingeRes};
Point(5402) = {Hinge54RefX - Arraythickness, Hinge54RefY, Hinge54RefZ, HingeRes};
Point(5403) = {Hinge54RefX - Arraythickness, Hinge54RefY - HingeWidth, Hinge54RefZ, HingeRes};
Point(5404) = {Hinge54RefX, Hinge54RefY - HingeWidth, Hinge54RefZ, HingeRes};

Point(5405) = {Hinge54RefX, Hinge54RefY, Hinge54RefZ - HingeLength, HingeRes};
Point(5406) = {Hinge54RefX - Arraythickness, Hinge54RefY, Hinge54RefZ - HingeLength, HingeRes};
Point(5407) = {Hinge54RefX - Arraythickness, Hinge54RefY - HingeWidth, Hinge54RefZ - HingeLength, HingeRes};
Point(5408) = {Hinge54RefX, Hinge54RefY - HingeWidth, Hinge54RefZ - HingeLength, HingeRes};

Point(5409) = {Hinge54RefX - Arraythickness, Hinge54RefY, Hinge54RefZ - HingeLength/2, HingeRes};
Point(5410) = {Hinge54RefX - Arraythickness, Hinge54RefY - HingeWidth, Hinge54RefZ - HingeLength/2, HingeRes};

Line(5430) = {5401, 5402};
Line(5431) = {5402, 5403};
Line(5432) = {5403, 5404};
Line(5433) = {5404, 5401};
Line(5434) = {5405, 5406};
Line(5435) = {5406, 5407};
Line(5436) = {5407, 5408};
Line(5437) = {5408, 5405};
Line(5438) = {5401, 5405};

Line(5439) = {5402, 5409};
Line(5440) = {5403, 5410};

Line(5441) = {5404, 5408};

Line(5442) = {5409, 5410};
Line(5443) = {5409, 5406};
Line(5444) = {5410, 5407};

Line Loop(5460) = {5430, 5431, 5432, 5433};
Line Loop(5461) = {5434, 5435, 5436, 5437};
Line Loop(5462) = {5430, 5439, 5443, -5434, -5438};
Line Loop(5463) = {5431, 5440, -5442, -5439};
Line Loop(5464) = {5432, 5441, -5436, -5444, -5440};
Line Loop(5465) = {5433, 5438, -5437, -5441};
Line Loop(5466) = {5442, 5444, -5435, -5443};

Plane Surface(5480) = {5460};
Plane Surface(5481) = {5461};
Plane Surface(5482) = {5462};
Plane Surface(5483) = {5463};
Plane Surface(5484) = {5464};
Plane Surface(5485) = {5465};
Plane Surface(5486) = {5466};

Surface Loop(54) = {5480, 5481, 5482, 5483, 5484, 5485, 5486};

//Group 55

Hinge55RefX = Segment47RefX + Arraythickness;
Hinge55RefY = Segment47RefY + HingeSep/2 + HingeWidth/2;
Hinge55RefZ = Segment47RefZ - Arraywidth + HingeSpace + HingeLength;

Point(5501) = {Hinge55RefX, Hinge55RefY, Hinge55RefZ, HingeRes};
Point(5502) = {Hinge55RefX - Arraythickness, Hinge55RefY, Hinge55RefZ, HingeRes};
Point(5503) = {Hinge55RefX - Arraythickness, Hinge55RefY - HingeWidth, Hinge55RefZ, HingeRes};
Point(5504) = {Hinge55RefX, Hinge55RefY - HingeWidth, Hinge55RefZ, HingeRes};

Point(5505) = {Hinge55RefX, Hinge55RefY, Hinge55RefZ - HingeLength, HingeRes};
Point(5506) = {Hinge55RefX - Arraythickness, Hinge55RefY, Hinge55RefZ - HingeLength, HingeRes};
Point(5507) = {Hinge55RefX - Arraythickness, Hinge55RefY - HingeWidth, Hinge55RefZ - HingeLength, HingeRes};
Point(5508) = {Hinge55RefX, Hinge55RefY - HingeWidth, Hinge55RefZ - HingeLength, HingeRes};

Point(5509) = {Hinge55RefX - Arraythickness, Hinge55RefY, Hinge55RefZ - HingeLength/2, HingeRes};
Point(5510) = {Hinge55RefX - Arraythickness, Hinge55RefY - HingeWidth, Hinge55RefZ - HingeLength/2, HingeRes};

Line(5530) = {5501, 5502};
Line(5531) = {5502, 5503};
Line(5532) = {5503, 5504};
Line(5533) = {5504, 5501};
Line(5534) = {5505, 5506};
Line(5535) = {5506, 5507};
Line(5536) = {5507, 5508};
Line(5537) = {5508, 5505};
Line(5538) = {5501, 5505};

Line(5539) = {5502, 5509};
Line(5540) = {5503, 5510};

Line(5541) = {5504, 5508};

Line(5542) = {5509, 5510};
Line(5543) = {5509, 5506};
Line(5544) = {5510, 5507};

Line Loop(5560) = {5530, 5531, 5532, 5533};
Line Loop(5561) = {5534, 5535, 5536, 5537};
Line Loop(5562) = {5530, 5539, 5543, -5534, -5538};
Line Loop(5563) = {5531, 5540, -5542, -5539};
Line Loop(5564) = {5532, 5541, -5536, -5544, -5540};
Line Loop(5565) = {5533, 5538, -5537, -5541};
Line Loop(5566) = {5542, 5544, -5535, -5543};

Plane Surface(5580) = {5560};
Plane Surface(5581) = {5561};
Plane Surface(5582) = {5562};
Plane Surface(5583) = {5563};
Plane Surface(5584) = {5564};
Plane Surface(5585) = {5565};
Plane Surface(5586) = {5566};

Surface Loop(55) = {5580, 5581, 5582, 5583, 5584, 5585, 5586};

//Group 56

Hinge56RefX = Segment48RefX + Arraythickness;
Hinge56RefY = Segment48RefY - ArraySegmentLength - HingeSep/2 + HingeWidth/2;
Hinge56RefZ = Segment48RefZ - HingeSpace;

Point(5601) = {Hinge56RefX, Hinge56RefY, Hinge56RefZ, HingeRes};
Point(5602) = {Hinge56RefX - Arraythickness, Hinge56RefY, Hinge56RefZ, HingeRes};
Point(5603) = {Hinge56RefX - Arraythickness, Hinge56RefY - HingeWidth, Hinge56RefZ, HingeRes};
Point(5604) = {Hinge56RefX, Hinge56RefY - HingeWidth, Hinge56RefZ, HingeRes};

Point(5605) = {Hinge56RefX, Hinge56RefY, Hinge56RefZ - HingeLength, HingeRes};
Point(5606) = {Hinge56RefX - Arraythickness, Hinge56RefY, Hinge56RefZ - HingeLength, HingeRes};
Point(5607) = {Hinge56RefX - Arraythickness, Hinge56RefY - HingeWidth, Hinge56RefZ - HingeLength, HingeRes};
Point(5608) = {Hinge56RefX, Hinge56RefY - HingeWidth, Hinge56RefZ - HingeLength, HingeRes};

Line(5630) = {5601, 5602};
Line(5631) = {5602, 5603};
Line(5632) = {5603, 5604};
Line(5633) = {5604, 5601};
Line(5634) = {5605, 5606};
Line(5635) = {5606, 5607};
Line(5636) = {5607, 5608};
Line(5637) = {5608, 5605};
Line(5638) = {5601, 5605};
Line(5639) = {5602, 5606};
Line(5640) = {5603, 5607};
Line(5641) = {5604, 5608};

Line Loop(5660) = {5630, 5631, 5632, 5633};
Line Loop(5661) = {5634, 5635, 5636, 5637};
Line Loop(5662) = {5630, 5639, -5634, -5638};
Line Loop(5663) = {5631, 5640, -5635, -5639};
Line Loop(5664) = {5632, 5641, -5636, -5640};
Line Loop(5665) = {5633, 5638, -5637, -5641};

Plane Surface(5680) = {5660};
Plane Surface(5681) = {5661};
Plane Surface(5682) = {5662};
Plane Surface(5683) = {5663};
Plane Surface(5684) = {5664};
Plane Surface(5685) = {5665};

Surface Loop(56) = {5680, 5681, 5682, 5683, 5684, 5685};

//Group 57

Hinge57RefX = Segment48RefX + Arraythickness;
Hinge57RefY = Segment48RefY - ArraySegmentLength - HingeSep/2 + HingeWidth/2;
Hinge57RefZ = Segment48RefZ - Arraywidth + HingeSpace + HingeLength;

Point(5701) = {Hinge57RefX, Hinge57RefY, Hinge57RefZ, HingeRes};
Point(5702) = {Hinge57RefX - Arraythickness, Hinge57RefY, Hinge57RefZ, HingeRes};
Point(5703) = {Hinge57RefX - Arraythickness, Hinge57RefY - HingeWidth, Hinge57RefZ, HingeRes};
Point(5704) = {Hinge57RefX, Hinge57RefY - HingeWidth, Hinge57RefZ, HingeRes};

Point(5705) = {Hinge57RefX, Hinge57RefY, Hinge57RefZ - HingeLength, HingeRes};
Point(5706) = {Hinge57RefX - Arraythickness, Hinge57RefY, Hinge57RefZ - HingeLength, HingeRes};
Point(5707) = {Hinge57RefX - Arraythickness, Hinge57RefY - HingeWidth, Hinge57RefZ - HingeLength, HingeRes};
Point(5708) = {Hinge57RefX, Hinge57RefY - HingeWidth, Hinge57RefZ - HingeLength, HingeRes};

Point(5709) = {Hinge57RefX - Arraythickness, Hinge57RefY, Hinge57RefZ - HingeLength/2, HingeRes};
Point(5710) = {Hinge57RefX - Arraythickness, Hinge57RefY - HingeWidth, Hinge57RefZ - HingeLength/2, HingeRes};

Line(5730) = {5701, 5702};
Line(5731) = {5702, 5703};
Line(5732) = {5703, 5704};
Line(5733) = {5704, 5701};
Line(5734) = {5705, 5706};
Line(5735) = {5706, 5707};
Line(5736) = {5707, 5708};
Line(5737) = {5708, 5705};
Line(5738) = {5701, 5705};

Line(5739) = {5702, 5709};
Line(5740) = {5703, 5710};

Line(5741) = {5704, 5708};

Line(5742) = {5709, 5710};
Line(5743) = {5709, 5706};
Line(5744) = {5710, 5707};

Line Loop(5760) = {5730, 5731, 5732, 5733};
Line Loop(5761) = {5734, 5735, 5736, 5737};
Line Loop(5762) = {5730, 5739, 5743, -5734, -5738};
Line Loop(5763) = {5731, 5740, -5742, -5739};
Line Loop(5764) = {5732, 5741, -5736, -5744, -5740};
Line Loop(5765) = {5733, 5738, -5737, -5741};
Line Loop(5766) = {5742, 5744, -5735, -5743};

Plane Surface(5780) = {5760};
Plane Surface(5781) = {5761};
Plane Surface(5782) = {5762};
Plane Surface(5783) = {5763};
Plane Surface(5784) = {5764};
Plane Surface(5785) = {5765};
Plane Surface(5786) = {5766};

Surface Loop(57) = {5780, 5781, 5782, 5783, 5784, 5785, 5786};


//Group 58

Hinge58RefX = Segment48RefX + Arraythickness;
Hinge58RefY = Segment48RefY + HingeSep/2 + HingeWidth/2;
Hinge58RefZ = Segment48RefZ - HingeSpace;

Point(5801) = {Hinge58RefX, Hinge58RefY, Hinge58RefZ, HingeRes};
Point(5802) = {Hinge58RefX - Arraythickness, Hinge58RefY, Hinge58RefZ, HingeRes};
Point(5803) = {Hinge58RefX - Arraythickness, Hinge58RefY - HingeWidth, Hinge58RefZ, HingeRes};
Point(5804) = {Hinge58RefX, Hinge58RefY - HingeWidth, Hinge58RefZ, HingeRes};

Point(5805) = {Hinge58RefX, Hinge58RefY, Hinge58RefZ - HingeLength, HingeRes};
Point(5806) = {Hinge58RefX - Arraythickness, Hinge58RefY, Hinge58RefZ - HingeLength, HingeRes};
Point(5807) = {Hinge58RefX - Arraythickness, Hinge58RefY - HingeWidth, Hinge58RefZ - HingeLength, HingeRes};
Point(5808) = {Hinge58RefX, Hinge58RefY - HingeWidth, Hinge58RefZ - HingeLength, HingeRes};

Line(5830) = {5801, 5802};
Line(5831) = {5802, 5803};
Line(5832) = {5803, 5804};
Line(5833) = {5804, 5801};
Line(5834) = {5805, 5806};
Line(5835) = {5806, 5807};
Line(5836) = {5807, 5808};
Line(5837) = {5808, 5805};
Line(5838) = {5801, 5805};
Line(5839) = {5802, 5806};
Line(5840) = {5803, 5807};
Line(5841) = {5804, 5808};

Line Loop(5860) = {5830, 5831, 5832, 5833};
Line Loop(5861) = {5834, 5835, 5836, 5837};
Line Loop(5862) = {5830, 5839, -5834, -5838};
Line Loop(5863) = {5831, 5840, -5835, -5839};
Line Loop(5864) = {5832, 5841, -5836, -5840};
Line Loop(5865) = {5833, 5838, -5837, -5841};

Plane Surface(5880) = {5860};
Plane Surface(5881) = {5861};
Plane Surface(5882) = {5862};
Plane Surface(5883) = {5863};
Plane Surface(5884) = {5864};
Plane Surface(5885) = {5865};

Surface Loop(58) = {5880, 5881, 5882, 5883, 5884, 5885};

//Group 59

Hinge59RefX = Segment48RefX + Arraythickness;
Hinge59RefY = Segment48RefY + HingeSep/2 + HingeWidth/2;
Hinge59RefZ = Segment48RefZ - Arraywidth + HingeSpace + HingeLength;

Point(5901) = {Hinge59RefX, Hinge59RefY, Hinge59RefZ, HingeRes};
Point(5902) = {Hinge59RefX - Arraythickness, Hinge59RefY, Hinge59RefZ, HingeRes};
Point(5903) = {Hinge59RefX - Arraythickness, Hinge59RefY - HingeWidth, Hinge59RefZ, HingeRes};
Point(5904) = {Hinge59RefX, Hinge59RefY - HingeWidth, Hinge59RefZ, HingeRes};

Point(5905) = {Hinge59RefX, Hinge59RefY, Hinge59RefZ - HingeLength, HingeRes};
Point(5906) = {Hinge59RefX - Arraythickness, Hinge59RefY, Hinge59RefZ - HingeLength, HingeRes};
Point(5907) = {Hinge59RefX - Arraythickness, Hinge59RefY - HingeWidth, Hinge59RefZ - HingeLength, HingeRes};
Point(5908) = {Hinge59RefX, Hinge59RefY - HingeWidth, Hinge59RefZ - HingeLength, HingeRes};

Point(5909) = {Hinge59RefX - Arraythickness, Hinge59RefY, Hinge59RefZ - HingeLength/2, HingeRes};
Point(5910) = {Hinge59RefX - Arraythickness, Hinge59RefY - HingeWidth, Hinge59RefZ - HingeLength/2, HingeRes};

Line(5930) = {5901, 5902};
Line(5931) = {5902, 5903};
Line(5932) = {5903, 5904};
Line(5933) = {5904, 5901};
Line(5934) = {5905, 5906};
Line(5935) = {5906, 5907};
Line(5936) = {5907, 5908};
Line(5937) = {5908, 5905};
Line(5938) = {5901, 5905};

Line(5939) = {5902, 5909};
Line(5940) = {5903, 5910};

Line(5941) = {5904, 5908};

Line(5942) = {5909, 5910};
Line(5943) = {5909, 5906};
Line(5944) = {5910, 5907};

Line Loop(5960) = {5930, 5931, 5932, 5933};
Line Loop(5961) = {5934, 5935, 5936, 5937};
Line Loop(5962) = {5930, 5939, 5943, -5934, -5938};
Line Loop(5963) = {5931, 5940, -5942, -5939};
Line Loop(5964) = {5932, 5941, -5936, -5944, -5940};
Line Loop(5965) = {5933, 5938, -5937, -5941};
Line Loop(5966) = {5942, 5944, -5935, -5943};

Plane Surface(5980) = {5960};
Plane Surface(5981) = {5961};
Plane Surface(5982) = {5962};
Plane Surface(5983) = {5963};
Plane Surface(5984) = {5964};
Plane Surface(5985) = {5965};
Plane Surface(5986) = {5966};

Surface Loop(59) = {5980, 5981, 5982, 5983, 5984, 5985, 5986};

//Group 60

Hinge60RefX = Segment49RefX + Arraythickness;
Hinge60RefY = Segment49RefY + HingeSep/2 + HingeWidth/2;
Hinge60RefZ = Segment49RefZ - HingeSpace;

Point(6001) = {Hinge60RefX, Hinge60RefY, Hinge60RefZ, HingeRes};
Point(6002) = {Hinge60RefX - Arraythickness, Hinge60RefY, Hinge60RefZ, HingeRes};
Point(6003) = {Hinge60RefX - Arraythickness, Hinge60RefY - HingeWidth, Hinge60RefZ, HingeRes};
Point(6004) = {Hinge60RefX, Hinge60RefY - HingeWidth, Hinge60RefZ, HingeRes};

Point(6005) = {Hinge60RefX, Hinge60RefY, Hinge60RefZ - HingeLength, HingeRes};
Point(6006) = {Hinge60RefX - Arraythickness, Hinge60RefY, Hinge60RefZ - HingeLength, HingeRes};
Point(6007) = {Hinge60RefX - Arraythickness, Hinge60RefY - HingeWidth, Hinge60RefZ - HingeLength, HingeRes};
Point(6008) = {Hinge60RefX, Hinge60RefY - HingeWidth, Hinge60RefZ - HingeLength, HingeRes};

// Translate{0,0,-0.745}{ Point{6001, 6002, 6003, 6004, 6005, 6006, 6007, 6008};}
Line(6030) = {6001, 6002};
Line(6031) = {6002, 6003};
Line(6032) = {6003, 6004};
Line(6033) = {6004, 6001};
Line(6034) = {6005, 6006};
Line(6035) = {6006, 6007};
Line(6036) = {6007, 6008};
Line(6037) = {6008, 6005};
Line(6038) = {6001, 6005};
Line(6039) = {6002, 6006};
Line(6040) = {6003, 6007};
Line(6041) = {6004, 6008};

Line Loop(6060) = {6030, 6031, 6032, 6033};
Line Loop(6061) = {6034, 6035, 6036, 6037};
Line Loop(6062) = {6030, 6039, -6034, -6038};
Line Loop(6063) = {6031, 6040, -6035, -6039};
Line Loop(6064) = {6032, 6041, -6036, -6040};
Line Loop(6065) = {6033, 6038, -6037, -6041};

Plane Surface(6080) = {6060};
Plane Surface(6081) = {6061};
Plane Surface(6082) = {6062};
Plane Surface(6083) = {6063};
Plane Surface(6084) = {6064};
Plane Surface(6085) = {6065};

Surface Loop(60) = {6080, 6081, 6082, 6083, 6084, 6085};


//S/A rotation
Angle = 76.5; //76.5
Radians = Angle*Pi/180;
Rotate{{0, 1, 0}, {-0.973, 0, 0}, Radians} {Surface{2439, 2440, 2441, 2442, 2443, 2444, 2445, 2446, 1839, 1840, 1841, 1842, 1843, 1844, 1845, 1846, 2339, 2340, 2341, 2342, 2343, 2344, 2345, 2346, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1239, 1240, 1241, 1242, 1243, 1244, 1245, 1246, 1639, 1640, 1641, 1642, 1643, 1644, 1645, 1646, 1739, 1740, 1741, 1742, 1743, 1744, 1745, 1746, 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2216, 2217, 2218, 2219, 2220, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1317, 1318, 1319, 1320, 1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520, 5180, 5181, 5182, 5183, 5184, 5185, 5280, 5281, 5282, 5283, 5284, 5285, 5286, 5380, 5381, 5382, 5383, 5384, 5385, 5480, 5481, 5482, 5483, 5484, 5485, 5486, 5580, 5581, 5582, 5583, 5584, 5585, 5586, 5680, 5681, 5682, 5683, 5684, 5685, 5780, 5781, 5782, 5783, 5784, 5785, 5786, 5880, 5881, 5882, 5883, 5884, 5885, 5980, 5981, 5982, 5983, 5984, 5985, 5986, 6080, 6081, 6082, 6083, 6084, 6085, 4580, 4581, 4582, 4583, 4584, 4585, 4586, 4587, 4588, 4589, 4590, 4680, 4681, 4682, 4683, 4684, 4685, 4686, 4687, 4688, 4689, 4690, 4780, 4781, 4782, 4783, 4784, 4785, 4786, 4787, 4788, 4789, 4790, 4880, 4881, 4882, 4883, 4884, 4885, 4886, 4887, 4888, 4889, 4890, 4980, 4981, 4982, 4983, 4984, 4985, 4986, 4987, 4988, 4989, 4990, 5080, 5081, 5082, 5083, 5084, 5085, 5086, 5087, 5088, 5089, 5090};}
//Sun shield (group 70)

//Back shield

Point(7000) = {ShieldRefX, ShieldRefY, ShieldRefZ, SCres};
Point(7001) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, ShieldRefZ + ShieldBackHeight/2, SCres};
Point(7002) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack - PatchLength, ShieldRefZ + ShieldBackHeight/2, SCres};
Point(7003) = {ShieldRefX, ShieldRefY - ShieldBackWidth/2, ShieldRefZ + ShieldBackHeight/2, SCres};
Point(7004) = {ShieldRefX, ShieldRefY - ShieldBackWidth/2, ShieldRefZ - ShieldBackHeight/2, SCres};
Point(7005) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack - PatchLength, ShieldRefZ - ShieldBackHeight/2, SCres};
Point(7006) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, ShieldRefZ - ShieldBackHeight/2, SCres};
Point(7007) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, ShieldRefZ - ShieldBackHeight/2 + BaffleDimBack, SCres};
Point(7008) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2, ShieldRefZ - ShieldBackHeight/2 + BaffleDimBack, SCres};
Point(7009) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2, ShieldRefZ - ShieldBackHeight/2 + BaffleDimBack + PatchLength, SCres};
Point(7010) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack - PatchLength, SCres};
Point(7011) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack, SCres};
Point(7012) = {ShieldRefX, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack, SCres};

Line(7030) = {7001, 7002};
Line(7031) = {7002, 7003};
Line(7032) = {7003, 7004};
Line(7033) = {7004, 7005};
Line(7034) = {7005, 7006};
Line(7035) = {7006, 7007};
Line(7036) = {7007, 7008};
Line(7037) = {7008, 7009};
Line(7038) = {7009, 7010};
Line(7039) = {7010, 7011};
Line(7040) = {7011, 7012};
Line(7041) = {7012, 7001};

Line Loop(7060) = {7030, 7031, 7032, 7033, 7034, 7035, 7036, 7037, 7038, 7039, 7040, 7041};
Plane Surface(7070) = {7060};

Extrude{ShieldBackThickness, 0, 0} {Surface{7070};}
Delete{ Volume{1};}

Surface Loop(70) = {7070, 7087, 7091, 7095, 7099, 7103, 7107, 7111, 7115, 7119, 7123, 7127, 7131, 7132};

//Front shield
Point(7133) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, ShieldRefZ + ShieldFrontHeight/2, SCres};
Point(7134) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY - ShieldFrontWidth/2, ShieldRefZ + ShieldFrontHeight/2, SCres};
Point(7135) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY - ShieldFrontWidth/2, ShieldRefZ - ShieldFrontHeight/2, SCres};
Point(7136) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, ShieldRefZ - ShieldFrontHeight/2, SCres};
Point(7137) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, ShieldRefZ - ShieldFrontHeight/2 + BaffleDimFront, SCres};
Point(7138) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY + ShieldFrontWidth/2, ShieldRefZ - ShieldFrontHeight/2 + BaffleDimFront, SCres};
Point(7139) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY + ShieldFrontWidth/2, ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront, SCres};
Point(7130) = {ShieldRefX + ShieldBackThickness - ShieldSep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront, SCres};

Line(7142) = {7133, 7134};
Line(7143) = {7134, 7135};
Line(7144) = {7135, 7136};
Line(7145) = {7136, 7137};
Line(7146) = {7137, 7138};
Line(7147) = {7138, 7139};
Line(7148) = {7139, 7130};
Line(7149) = {7130, 7133};

Line Loop(7161) = {7142, 7143, 7144, 7145, 7146, 7147, 7148, 7149};
Plane Surface(7171) = {7161};

Extrude{-ShieldFrontThickness, 0, 0} {Surface{7171};}
Delete{ Volume{1};}

Surface Loop(71) = {7171, 7184, 7188, 7192, 7196, 7200, 7204, 7208, 7212, 7213};

//Upper Baffle

Point(7201) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, ShieldRefZ + ShieldFrontHeight/2, SCres};
Point(7202) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront - BaffleThickness, ShieldRefZ + ShieldFrontHeight/2, SCres};
Point(7203) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront - BaffleThickness, ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront - BaffleThickness, SCres};
Point(7204) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2, ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront - BaffleThickness, SCres};
Point(7205) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2, ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront, SCres};
Point(7206) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront, SCres};

Point(7207) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, ShieldRefZ + ShieldBackHeight/2, SCres};
Point(7208) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack - BaffleThickness, ShieldRefZ + ShieldBackHeight/2, SCres};
Point(7209) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack - BaffleThickness, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack - BaffleThickness, SCres};
Point(7210) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack - BaffleThickness, SCres};
Point(7211) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack, SCres};
Point(7212) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack, SCres};

Line(7220) = {7201, 7202};
Line(7221) = {7202, 7203};
Line(7222) = {7203, 7204};
Line(7223) = {7204, 7205};
Line(7224) = {7205, 7206};
Line(7225) = {7206, 7201};

Line(7226) = {7207, 7208};
Line(7227) = {7208, 7209};
Line(7228) = {7209, 7210};
Line(7229) = {7210, 7211};
Line(7230) = {7211, 7212};
Line(7231) = {7212, 7207};

Line(7232) = {7201, 7207};
Line(7233) = {7202, 7208};
Line(7234) = {7203, 7209};
Line(7235) = {7204, 7210};
Line(7236) = {7205, 7211};
Line(7237) = {7206, 7212};

Line Loop(7240) = {7220, 7221, 7222, 7223, 7224, 7225};
Line Loop(7241) = {7226, 7227, 7228, 7229, 7230, 7231};
Line Loop(7242) = {7220, 7233, -7226, -7232};
Line Loop(7243) = {7221, 7234, -7227, -7233};
Line Loop(7244) = {7222, 7235, -7228, -7234};
Line Loop(7245) = {7223, 7236, -7229, -7235};
Line Loop(7246) = {7224, 7237, -7230, -7236};
Line Loop(7247) = {7225, 7232, -7231, -7237};

Plane Surface(7250) = {7240};
Plane Surface(7251) = {7241};
Plane Surface(7252) = {7242};
Plane Surface(7253) = {7243};
Plane Surface(7254) = {7244};
Plane Surface(7255) = {7245};
Plane Surface(7256) = {7246};
Plane Surface(7257) = {7247};

Surface Loop(72) = {7250, 7251, 7252, 7253, 7254, 7255, 7256, 7257};

Translate{0, -0.170, 0} {Surface{7087, 7131, 7251, 7252, 7253, 7257, 7250, 7212};}

Translate{0, 0.170, 0}{Surface{7255};}

//Lower Baffle

Point(7301) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, -(ShieldRefZ + ShieldFrontHeight/2), SCres};
Point(7302) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront - BaffleThickness, -(ShieldRefZ + ShieldFrontHeight/2), SCres};
Point(7303) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront - BaffleThickness, -(ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront - BaffleThickness), SCres};
Point(7304) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2, -(ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront - BaffleThickness), SCres};
Point(7305) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2, -(ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront), SCres};
Point(7306) = {ShieldRefX + ShieldBackThickness - ShieldSep + segsep, ShieldRefY + ShieldFrontWidth/2 - BaffleDimFront, -(ShieldRefZ + ShieldFrontHeight/2 - BaffleDimFront), SCres};

Point(7307) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, -(ShieldRefZ + ShieldBackHeight/2), SCres};
Point(7308) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack - BaffleThickness, -(ShieldRefZ + ShieldBackHeight/2), SCres};
Point(7309) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack - BaffleThickness, -(ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack - BaffleThickness), SCres};
Point(7310) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2, -(ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack - BaffleThickness), SCres};
Point(7311) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2, -(ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack), SCres};
Point(7312) = {ShieldRefX - segsep, ShieldRefY + ShieldBackWidth/2 - BaffleDimBack, -(ShieldRefZ + ShieldBackHeight/2 - BaffleDimBack), SCres};

Line(7320) = {7301, 7302};
Line(7321) = {7302, 7303};
Line(7322) = {7303, 7304};
Line(7323) = {7304, 7305};
Line(7324) = {7305, 7306};
Line(7325) = {7306, 7301};

Line(7326) = {7307, 7308};
Line(7327) = {7308, 7309};
Line(7328) = {7309, 7310};
Line(7329) = {7310, 7311};
Line(7330) = {7311, 7312};
Line(7331) = {7312, 7307};

Line(7332) = {7301, 7307};
Line(7333) = {7302, 7308};
Line(7334) = {7303, 7309};
Line(7335) = {7304, 7310};
Line(7336) = {7305, 7311};
Line(7337) = {7306, 7312};

Line Loop(7340) = {7320, 7321, 7322, 7323, 7324, 7325};
Line Loop(7341) = {7326, 7327, 7328, 7329, 7330, 7331};
Line Loop(7342) = {7320, 7333, -7326, -7332};
Line Loop(7343) = {7321, 7334, -7327, -7333};
Line Loop(7344) = {7322, 7335, -7328, -7334};
Line Loop(7345) = {7323, 7336, -7329, -7335};
Line Loop(7346) = {7324, 7337, -7330, -7336};
Line Loop(7347) = {7325, 7332, -7331, -7337};

Plane Surface(7350) = {7340};
Plane Surface(7351) = {7341};
Plane Surface(7352) = {7342};
Plane Surface(7353) = {7343};
Plane Surface(7354) = {7344};
Plane Surface(7355) = {7345};
Plane Surface(7356) = {7346};
Plane Surface(7357) = {7347};

Surface Loop(73) = {7350, 7351, 7352, 7353, 7354, 7355, 7356, 7357};

//SOLO HI	(Group 74)
XSep = 0.590; 	//From sun shield
YSep = 0.213;	//From S/C box
HIHeight = 0.15;
HILength = 0.610;
HIWidth = 0.128;
PlateLength = 0.470;	//Non-conductive
SHIres=SCres/4;

Point(7401) = {SCrefx - SCdimX + XSep + HILength-PlateLength, SCrefy - SCdimY - YSep, SCrefz, SHIres};
Point(7402) = {SCrefx - SCdimX + XSep, SCrefy - SCdimY - YSep - HIWidth, SCrefz, SHIres};
Point(7403) = {SCrefx - SCdimX + XSep + PlateLength, SCrefy - SCdimY - YSep - HIWidth, SCrefz, SHIres};
Point(7404) = {SCrefx - SCdimX + XSep + HILength, SCrefy - SCdimY - YSep - HIWidth, SCrefz, SHIres};
Point(7405) = {SCrefx - SCdimX + XSep + PlateLength, SCrefy - SCdimY - YSep, SCrefz, SHIres};

Line(7420) = {7401, 7402};
Line(7421) = {7402, 7403};
Line(7422) = {7403, 7404};
Line(7423) = {7404, 7405};
Line(7424) = {7405, 7401};

Line Loop(7460) = {7420, 7421, 7422, 7423, 7424};
Plane Surface(7480) = {7460};

Extrude{0, 0, -HIHeight} {Surface{7480};}
Delete{ Volume{1};}

Surface Loop(74) = {7480, 7490, 7494, 7498, 7502, 7506, 7507};

//HIS (Group 75)
HISYSep = 0.03;
CuboidHeight = 0.1;
CuboidWidth = 0.2;
CuboidLength = 0.30;
CylinderHeight = 0.171;
CylinderRadius =  0.15;
HISres=SCres/4;

Point(7501) = {SCrefx - SCdimX, SCrefy + HISYSep + CuboidLength, SCrefz + CuboidHeight, HISres};
Point(7502) = {SCrefx - SCdimX, SCrefy + HISYSep, SCrefz + CuboidHeight, HISres};
Point(7503) = {SCrefx - SCdimX + CuboidWidth, SCrefy + HISYSep, SCrefz + CuboidHeight, HISres};
Point(7504) = {SCrefx - SCdimX + CuboidWidth, SCrefy + HISYSep + CuboidLength, SCrefz + CuboidHeight, HISres};
Point(7505) = {SCrefx - SCdimX + CylinderRadius*Sin(36*Pi/180), SCrefy + HISYSep + CuboidLength/2 + CylinderRadius*Cos(36*Pi/180), SCrefz + CuboidHeight, HISres};
Point(7506) = {SCrefx - SCdimX, SCrefy + HISYSep + CuboidLength/2, SCrefz + CuboidHeight, HISres};

Point(7507) = {SCrefx - SCdimX, SCrefy + HISYSep + CuboidLength, SCrefz, HISres};
Point(7508) = {SCrefx - SCdimX, SCrefy + HISYSep, SCrefz, HISres};
Point(7509) = {SCrefx - SCdimX + CuboidWidth, SCrefy + HISYSep, SCrefz, HISres};
Point(7510) = {SCrefx - SCdimX + CuboidWidth, SCrefy + HISYSep + CuboidLength, SCrefz, HISres};

Point(7511) = {SCrefx - SCdimX, SCrefy + HISYSep + CuboidLength, SCrefz + CuboidHeight + CylinderHeight, HISres};
Point(7512) = {SCrefx - SCdimX, SCrefy + HISYSep, SCrefz + CuboidHeight + CylinderHeight, HISres};
Point(7513) = {SCrefx - SCdimX + CylinderRadius*Sin(36*Pi/180), SCrefy + HISYSep + CuboidLength/2  + CylinderRadius*Cos(36*Pi/180), SCrefz + CuboidHeight + CylinderHeight, HISres};
Point(7514) = {SCrefx - SCdimX, SCrefy + HISYSep + CuboidLength/2, SCrefz + CuboidHeight + CylinderHeight, HISres};

Point(7515) = {SCrefx - SCdimX + CylinderRadius*Sin(72*Pi/180), SCrefy + HISYSep + CuboidLength/2 + CylinderRadius*Cos(72*Pi/180), SCrefz + CuboidHeight, HISres};
Point(7516) = {SCrefx - SCdimX + CylinderRadius*Sin(72*Pi/180), SCrefy + HISYSep + CuboidLength/2 - CylinderRadius*Cos(72*Pi/180), SCrefz + CuboidHeight, HISres};
Point(7517) = {SCrefx - SCdimX + CylinderRadius*Sin(36*Pi/180), SCrefy + HISYSep + CuboidLength/2 - CylinderRadius*Cos(36*Pi/180), SCrefz + CuboidHeight, HISres};

Point(7518) = {SCrefx - SCdimX + CylinderRadius*Sin(72*Pi/180), SCrefy + HISYSep + CuboidLength/2 + CylinderRadius*Cos(72*Pi/180), SCrefz + CuboidHeight + CylinderHeight, HISres};
Point(7519) = {SCrefx - SCdimX + CylinderRadius*Sin(72*Pi/180), SCrefy + HISYSep + CuboidLength/2 - CylinderRadius*Cos(72*Pi/180), SCrefz + CuboidHeight + CylinderHeight, HISres};
Point(7520) = {SCrefx - SCdimX + CylinderRadius*Sin(36*Pi/180), SCrefy + HISYSep + CuboidLength/2 - CylinderRadius*Cos(36*Pi/180), SCrefz + CuboidHeight + CylinderHeight, HISres};

Line(7522) = {7502, 7503};
Line(7523) = {7503, 7504};
Line(7524) = {7504, 7501};

Line(7525) = {7507, 7508};
Line(7526) = {7508, 7509};
Line(7527) = {7509, 7510};
Line(7528) = {7510, 7507};

Line(7529) = {7501, 7507};
Line(7530) = {7502, 7508};
Line(7531) = {7503, 7509};
Line(7532) = {7504, 7510};

Line(7535) = {7512, 7511};
Line(7536) = {7511, 7501};
Line(7537) = {7513, 7505};
Line(7538) = {7512, 7502};

Line(7539) = {7515, 7518};
Line(7540) = {7516, 7519};
Line(7541) = {7517, 7520};

Circle(7542) = {7501, 7506, 7505};
Circle(7543) = {7505, 7506, 7515};
Circle(7544) = {7515, 7506, 7516};
Circle(7545) = {7516, 7506, 7517};
Circle(7546) = {7517, 7506, 7502};

Circle(7547) = {7511, 7514, 7513};
Circle(7548) = {7513, 7514, 7518};
Circle(7549) = {7518, 7514, 7519};
Circle(7550) = {7519, 7514, 7520};
Circle(7551) = {7520, 7514, 7512};

Line Loop(7560) = {7525, 7526, 7527, 7528};
Line Loop(7561) = {7524, 7529, -7528, -7532};
Line Loop(7562) = {7523, 7532, -7527, -7531};
Line Loop(7563) = {7522, 7531, -7526, -7530};

Line Loop(7568) = {7536, 7529, 7525, -7530, -7538, 7535};
Line Loop(7569) = {7542, 7543, 7544, 7545, 7546, 7522, 7523, 7524};
Line Loop(7570) = {7535, 7547, 7548, 7549, 7550, 7551};
Line Loop(7571) = {7536, 7542, -7537, -7547};
Line Loop(7572) = {7537, 7543, 7539, -7548};
Line Loop(7573) = {7539, 7549, -7540, -7544};
Line Loop(7574) = {7540, 7550, -7541, -7545};
Line Loop(7575) = {7541, 7551, 7538, -7546};

Plane Surface(7580) = {7560};
Plane Surface(7581) = {7561};
Plane Surface(7582) = {7562};
Plane Surface(7583) = {7563};

Plane Surface(7588) = {7568};
Plane Surface(7589) = {7569};
Plane Surface(7590) = {7570};
Ruled Surface(7591) = {7571};
Ruled Surface(7592) = {7572};
Ruled Surface(7593) = {7573};
Ruled Surface(7594) = {7574};
Ruled Surface(7595) = {7575};


Surface Loop(75) = {7580, 7581, 7582, 7583, 7588, 7589, 7590, 7591, 7592, 7593, 7594, 7595};

//PAS	(Group 76)

PASYSep = 0.0385;
PASZSep = 0.0912;
PASCuboidLength = 0.3220;
PASCuboidWidth = 0.125;
PASCuboidHeight = 0.1415;
CylinderRadius = 0.043;
CylinderCenter = 0.2173;
CylinderHeight = 0.061;
PatchWidth = 0.1020;
PatchLength = 0.080;
PatchSep = 0.0095;
PASres=SCres/4;

Point(7601) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + PASCuboidLength, SCrefz - SCdimZ - PASZSep, PASres};
Point(7602) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + CylinderCenter + CylinderRadius, SCrefz - SCdimZ - PASZSep, PASres};
Point(7603) = {SCrefx - SCdimX, SCrefy + PASYSep + CylinderCenter, SCrefz - SCdimZ - PASZSep, PASres};
Point(7604) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + CylinderCenter - CylinderRadius, SCrefz - SCdimZ - PASZSep, PASres};
Point(7605) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep, SCrefz - SCdimZ - PASZSep, PASres};
Point(7606) = {SCrefx - SCdimX + CylinderRadius + PASCuboidWidth, SCrefy + PASYSep, SCrefz - SCdimZ - PASZSep, PASres};
Point(7607) = {SCrefx - SCdimX + CylinderRadius + PASCuboidWidth, SCrefy + PASYSep + PASCuboidLength, SCrefz - SCdimZ - PASZSep, PASres};
Point(7608) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + CylinderCenter, SCrefz - SCdimZ - PASZSep, PASres};

Point(7609) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + PASCuboidLength, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7610) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + CylinderCenter + CylinderRadius, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7611) = {SCrefx - SCdimX, SCrefy + PASYSep + CylinderCenter, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7612) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + CylinderCenter - CylinderRadius, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7613) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7614) = {SCrefx - SCdimX + CylinderRadius + PASCuboidWidth, SCrefy + PASYSep, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7615) = {SCrefx - SCdimX + CylinderRadius + PASCuboidWidth, SCrefy + PASYSep + PASCuboidLength, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7616) = {SCrefx - SCdimX + CylinderRadius, SCrefy + PASYSep + CylinderCenter, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7617) = {SCrefx - SCdimX + 2*CylinderRadius, SCrefy + PASYSep + CylinderCenter, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};

Point(7618) = {SCrefx - SCdimX + CylinderRadius + PatchSep, SCrefy + PASYSep + PatchSep + PatchLength, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7619) = {SCrefx - SCdimX + CylinderRadius + PatchSep, SCrefy + PASYSep + PatchSep, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7620) = {SCrefx - SCdimX + CylinderRadius + PatchSep + PatchWidth, SCrefy + PASYSep + PatchSep, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};
Point(7621) = {SCrefx - SCdimX + CylinderRadius + PatchSep + PatchWidth, SCrefy + PASYSep + PatchSep + PatchLength, SCrefz - SCdimZ - PASZSep - PASCuboidHeight, PASres};


Line(7630) = {7601, 7602};
Circle(7631) = {7602, 7608, 7603};
Circle(7632) = {7603, 7608, 7604};
Line(7633) = {7604, 7605};
Line(7634) = {7605, 7606};
Line(7635) = {7606, 7607};
Line(7636) = {7607, 7601};

Line(7637) = {7609, 7610};
Circle(7638) = {7610, 7616, 7611};
Circle(7639) = {7611, 7616, 7612};
Line(7640) = {7612, 7613};
Line(7641) = {7613, 7614};
Line(7642) = {7614, 7615};
Line(7643) = {7615, 7609};
Circle(7644) = {7612, 7616, 7617};
Circle(7645) = {7617, 7616, 7610};

Line(7646) = {7618, 7619};
Line(7647) = {7619, 7620};
Line(7648) = {7620, 7621};
Line(7649) = {7621, 7618};

Line(7650) = {7601, 7609};
Line(7651) = {7602, 7610};
Line(7652) = {7603, 7611};
Line(7653) = {7604, 7612};
Line(7654) = {7605, 7613};
Line(7655) = {7606, 7614};
Line(7656) = {7607, 7615};


Line Loop(7660) = {7630, 7631, 7632, 7633, 7634, 7635, 7636};
Line Loop(7661) = {7638, 7639, 7644, 7645};
Line Loop(7662) = {7637, -7645, -7644, 7640, 7641, 7642, 7643};
Line Loop(7663) = {7646, 7647, 7648, 7649};

Line Loop(7664) = {7636, 7650, -7643, -7656};
Line Loop(7665) = {7630, 7651, -7637, -7650};
Line Loop(7666) = {7631, 7652, -7638, -7651};
Line Loop(7667) = {7632, 7653, -7639, -7652};
Line Loop(7668) = {7633, 7654, -7640, -7653};
Line Loop(7669) = {7634, 7655, -7641, -7654};
Line Loop(7670) = {7635, 7656, -7642, -7655};

Plane Surface(7680) = {7660};
Plane Surface(7681) = {7661};
Plane Surface(7682) = {7662, 7663};
Plane Surface(7683) = {7663};
Plane Surface(7684) = {7664};
Plane Surface(7685) = {7665};
Ruled Surface(7686) = {7666};
Ruled Surface(7687) = {7667};
Plane Surface(7688) = {7668};
Plane Surface(7689) = {7669};
Plane Surface(7690) = {7670};

Extrude{0, 0, -CylinderHeight} {Surface{7681};}
Delete{ Volume{1};}

Surface Loop(76) = {7680, 7682, 7683, 7684, 7685, 7686, 7687, 7688, 7689, 7690, 7699, 7703, 7707, 7711, 7712};

//Baffle
BaffleRes = EASRes;
BaffleSepX = 0.165;
BaffleSepZ = 0.09;
BaffleHeight = 0.38463;
BaffleWidth = 0.44741;
BaffleThick = 0.02;


Point(8100) = {EASRefX - BaffleSepX, EASRefY, EASRefZ + BaffleSepZ, BaffleRes};
Point(8101) = {EASRefX - BaffleSepX, EASRefY + BaffleWidth/2, EASRefZ + BaffleSepZ, BaffleRes};
Point(8102) = {EASRefX - BaffleSepX, EASRefY + BaffleWidth/2, EASRefZ + BaffleSepZ - BaffleHeight, BaffleRes};
Point(8103) = {EASRefX - BaffleSepX, EASRefY - BaffleWidth/2, EASRefZ + BaffleSepZ - BaffleHeight, BaffleRes};
Point(8104) = {EASRefX - BaffleSepX, EASRefY - BaffleWidth/2, EASRefZ + BaffleSepZ, BaffleRes};
Point(8105) = {EASRefX - BaffleSepX - BaffleThick, EASRefY + BaffleWidth/2, EASRefZ + BaffleSepZ, BaffleRes};
Point(8106) = {EASRefX - BaffleSepX - BaffleThick, EASRefY + BaffleWidth/2, EASRefZ + BaffleSepZ - BaffleHeight, BaffleRes};
Point(8107) = {EASRefX - BaffleSepX - BaffleThick, EASRefY - BaffleWidth/2, EASRefZ + BaffleSepZ - BaffleHeight, BaffleRes};
Point(8108) = {EASRefX - BaffleSepX - BaffleThick, EASRefY - BaffleWidth/2, EASRefZ + BaffleSepZ, BaffleRes};

Line(8120) = {8101, 8102};
Line(8121) = {8102, 8103};
Line(8122) = {8103, 8104};
Line(8123) = {8104, 8101};
Line(8124) = {8101, 8105};
Line(8125) = {8102, 8106};
Line(8126) = {8103, 8107};
Line(8127) = {8104, 8108};
Line(8128) = {8105, 8106};
Line(8129) = {8106, 8107};
Line(8130) = {8107, 8108};
Line(8131) = {8108, 8105};

Line Loop(8140) = {8120, 8121, 8122, 8123};
Line Loop(8141) = {8120, 8125, -8128, -8124};
Line Loop(8142) = {8121, 8126, -8129, -8125};
Line Loop(8143) = {8122, 8127, -8130, -8126};
Line Loop(8144) = {8123, 8124, -8131, -8127};
Line Loop(8145) = {8131, 8128, 8129, 8130};

Plane Surface(8160) = {8140};
Plane Surface(8161) = {8141};
Plane Surface(8162) = {8142};
Plane Surface(8163) = {8143};
Plane Surface(8164) = {8144};
Plane Surface(8165) = {8145};

Surface Loop(81) = {8160, 8161, 8162, 8163, 8164, 8165};

//External Boundary (Group 3)

bx = 12.0;
by = 20.0;
bz = 12.0;
braf = 0.5;

Point(0) = {0, 0, 0, 1};
Point(39) = {bx, 0, 0, braf};
Point(310) = {-bx, 0, 0, braf};
Point(311) = {0, by, 0, braf};
Point(312) = {0, -by, 0, braf};
Point(313) = {0, 0, bz, braf};
Point(314) = {0, 0, -bz, braf};

Ellipse(327) = {310, 0, 39, 313};
Ellipse(328) = {39, 0, 310, 313};
Ellipse(329) = {311, 0, 312, 313};
Ellipse(330) = {312, 0, 311, 313};
Ellipse(331) = {314, 0, 313, 39};
Ellipse(332) = {314, 0, 313, 310};
Ellipse(333) = {310, 0, 39, 312};
Ellipse(334) = {312, 0, 311, 39};
Ellipse(335) = {39, 0, 310, 311};
Ellipse(336) = {310, 0, 39, 311};
Ellipse(337) = {314, 0, 313, 311};
Ellipse(338) = {312, 0, 314, 314};

Line Loop(339) = {330, -328, -334};
Ruled Surface(340) = {339};
Line Loop(341) = {328, -329, -335};
Ruled Surface(342) = {341};
Line Loop(343) = {329, -327, 336};
Ruled Surface(344) = {343};
Line Loop(345) = {333, 330, -327};
Ruled Surface(346) = {345};
Line Loop(347) = {338, 331, -334};
Ruled Surface(348) = {347};
Line Loop(349) = {331, 335, -337};
Ruled Surface(350) = {349};
Line Loop(351) = {337, -336, -332};
Ruled Surface(352) = {351};
Line Loop(353) = {332, 333, 338};
Ruled Surface(354) = {353};

Surface Loop(3) = {340, 342, 344, 346, 348, 350, 352, 354};

//Magnetometers

Magres = Boomres/2;
MagHeight = 0.112;
MagRadius = 0.04;

//MAGIBS
MAGIBSRefX = SCrefx + segsep + 1.1619;
MAGIBSRefY = -0.1825;
MAGIBSRefZ = SCrefz - 0.27;

Point(8200) = {MAGIBSRefX, MAGIBSRefY, MAGIBSRefZ, Magres};
Point(8201) = {MAGIBSRefX + MagRadius, MAGIBSRefY, MAGIBSRefZ, Magres};
Point(8202) = {MAGIBSRefX, MAGIBSRefY + MagRadius, MAGIBSRefZ, Magres};
Point(8203) = {MAGIBSRefX - MagRadius, MAGIBSRefY, MAGIBSRefZ, Magres};
Point(8204) = {MAGIBSRefX, MAGIBSRefY - MagRadius, MAGIBSRefZ, Magres};

Point(8205) = {MAGIBSRefX, MAGIBSRefY, MAGIBSRefZ - MagHeight, Magres};
Point(8206) = {MAGIBSRefX + MagRadius, MAGIBSRefY, MAGIBSRefZ - MagHeight, Magres};
Point(8207) = {MAGIBSRefX, MAGIBSRefY + MagRadius, MAGIBSRefZ - MagHeight, Magres};
Point(8208) = {MAGIBSRefX - MagRadius, MAGIBSRefY, MAGIBSRefZ - MagHeight, Magres};
Point(8209) = {MAGIBSRefX, MAGIBSRefY - MagRadius, MAGIBSRefZ - MagHeight, Magres};

Circle(8220) = {8201, 8200, 8202};
Circle(8221) = {8202, 8200, 8203};
Circle(8222) = {8203, 8200, 8204};
Circle(8223) = {8204, 8200, 8201};

Circle(8224) = {8206, 8205, 8207};
Circle(8225) = {8207, 8205, 8208};
Circle(8226) = {8208, 8205, 8209};
Circle(8227) = {8209, 8205, 8206};

Line(8230) = {8201, 8206};
Line(8231) = {8202, 8207};
Line(8232) = {8203, 8208};
Line(8233) = {8204, 8209};

Line Loop(8240) = {8220, 8221, 8222, 8223};
Plane Surface(8240) = {8240};

Line Loop(8241) = {8220, 8231, -8224, -8230};
Ruled Surface(8241) = {8241};

Line Loop(8242) = {8221, 8232, -8225, -8231};
Ruled Surface(8242) = {8242};

Line Loop(8243) = {8222, 8233, -8226, -8232};
Ruled Surface(8243) = {8243};

Line Loop(8244) = {8223, 8230, -8227, -8233};
Ruled Surface(8244) = {8244};

Line Loop(8245) = {8224, 8225, 8226, 8227};
Plane Surface(8245) = {8245};

Rotate{{0,1,0},{MAGIBSRefX, MAGIBSRefY, MAGIBSRefZ}, 0.279857}{Surface{8240, 8241, 8242, 8243, 8244, 8245};}

Surface Loop(82) = {8240, 8241, 8242, 8243, 8244, 8245};

//SCM

SCMHeight = 0.180;
SCMWidth = 0.147;
SCMDepth = 0.124;

SCMRefX = MAGIBSRefX + 0.9532;
SCMRefY = MAGIBSRefY + 0.062;
SCMRefZ = MAGIBSRefZ - 0.275;

//MAGIBS

MAGOBSRefX = SCMRefX + 1.2017;
MAGOBSRefY = SCMRefY + 0.065;
MAGOBSRefZ = SCMRefZ - 0.345;

Point(8400) = {MAGOBSRefX, MAGOBSRefY, MAGOBSRefZ, Magres};
Point(8401) = {MAGOBSRefX + MagRadius, MAGOBSRefY, MAGOBSRefZ, Magres};
Point(8402) = {MAGOBSRefX, MAGOBSRefY + MagRadius, MAGOBSRefZ, Magres};
Point(8403) = {MAGOBSRefX - MagRadius, MAGOBSRefY, MAGOBSRefZ, Magres};
Point(8404) = {MAGOBSRefX, MAGOBSRefY - MagRadius, MAGOBSRefZ, Magres};

Point(8405) = {MAGOBSRefX, MAGOBSRefY, MAGOBSRefZ - MagHeight, Magres};
Point(8406) = {MAGOBSRefX + MagRadius, MAGOBSRefY, MAGOBSRefZ - MagHeight, Magres};
Point(8407) = {MAGOBSRefX, MAGOBSRefY + MagRadius, MAGOBSRefZ - MagHeight, Magres};
Point(8408) = {MAGOBSRefX - MagRadius, MAGOBSRefY, MAGOBSRefZ - MagHeight, Magres};
Point(8409) = {MAGOBSRefX, MAGOBSRefY - MagRadius, MAGOBSRefZ - MagHeight, Magres};

Circle(8420) = {8401, 8400, 8402};
Circle(8421) = {8402, 8400, 8403};
Circle(8422) = {8403, 8400, 8404};
Circle(8423) = {8404, 8400, 8401};

Circle(8424) = {8406, 8405, 8407};
Circle(8425) = {8407, 8405, 8408};
Circle(8426) = {8408, 8405, 8409};
Circle(8427) = {8409, 8405, 8406};

Line(8430) = {8401, 8406};
Line(8431) = {8402, 8407};
Line(8432) = {8403, 8408};
Line(8433) = {8404, 8409};

Line Loop(8440) = {8420, 8421, 8422, 8423};
Plane Surface(8440) = {8440};

Line Loop(8441) = {8420, 8431, -8424, -8430};
Ruled Surface(8441) = {8441};

Line Loop(8442) = {8421, 8432, -8425, -8431};
Ruled Surface(8442) = {8442};

Line Loop(8443) = {8422, 8433, -8426, -8432};
Ruled Surface(8443) = {8443};

Line Loop(8444) = {8423, 8430, -8427, -8433};
Ruled Surface(8444) = {8444};

Line Loop(8445) = {8424, 8425, 8426, 8427};
Plane Surface(8445) = {8445};

Rotate{{0,1,0},{MAGOBSRefX, MAGOBSRefY, MAGOBSRefZ}, 0.279857}{Surface{8440, 8441, 8442, 8443, 8444, 8445};}

Surface Loop(84) = {8440, 8441, 8442, 8443, 8444, 8445};

// mast HGA

Point(9933) = {-l7e/2,-l3h/2    ,-l2-l3p-l7    ,m5};
Point(9934) = { l7e/2,-l3h/2    ,-l2-l3p-l7    ,m5};
Point(9935) = { l7e/2,-l3h/2    ,-l2-l3p-l7-l7e,m5};
Point(9936) = {-l7e/2,-l3h/2    ,-l2-l3p-l7-l7e,m5};
Point(9937) = {-l7e/2,-l3h/2-l7L,-l2-l3p-l7    ,m5};
Point(9938) = { l7e/2,-l3h/2-l7L,-l2-l3p-l7    ,m5};
Point(9939) = { l7e/2,-l3h/2-l7L,-l2-l3p-l7-l7e,m5};
Point(9940) = {-l7e/2,-l3h/2-l7L,-l2-l3p-l7-l7e,m5};
Point(991000)={xc_hga,yc_hga,zc_hga,m5}; /* Point sur axe de rotation pour antenne HGA*/

// HGA antenna (with rotation around parallel axe to Y)

Point(9951) = {xc_hga                     +sa_hga*(-l2-l3p-l7-l7s    -zc_hga),-l3h/2-l7L    ,zc_hga                     +ca_hga*(-l2-l3p-l7-l7s    -zc_hga),m5};
Point(9952) = {xc_hga                     +sa_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),-l3h/2-l7L    ,zc_hga                     +ca_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),m5};
Point(9953) = {xc_hga+ca_hga*(-l8r-xc_hga)+sa_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),-l3h/2-l7L    ,zc_hga-sa_hga*(-l8r-xc_hga)+ca_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),m5};
Point(9954) = {xc_hga                     +sa_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),-l3h/2-l7L+l8r,zc_hga                     +ca_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),m5};
Point(9955) = {xc_hga+ca_hga*( l8r-xc_hga)+sa_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),-l3h/2-l7L    ,zc_hga-sa_hga*( l8r-xc_hga)+ca_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),m5};
Point(9956) = {xc_hga                     +sa_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),-l3h/2-l7L-l8r,zc_hga                     +ca_hga*(-l2-l3p-l7-l7s-l8p-zc_hga),m5};
Point(9957) = {xc_hga                     +sa_hga*(-l2-l3p-l7-l7s-l8Z-zc_hga),-l3h/2-l7L    ,zc_hga                     +ca_hga*(-l2-l3p-l7-l7s-l8Z-zc_hga),m5}; /* "foyer" de l'antenne */

Line(99125) = {9933, 9934};
Line(99126) = {9934, 9935};
Line(99127) = {9935, 9936};
Line(99128) = {9936, 9933};
Line(99129) = {9937, 9938};
Line(99130) = {9938, 9939};
Line(99131) = {9939, 9940};
Line(99132) = {9940, 9937};
Line(99133) = {9933, 9937};
Line(99134) = {9934, 9938};
Line(99135) = {9935, 9939};
Line(99136) = {9936, 9940};

Circle(99141) = {9953, 9952, 9954};
Circle(99142) = {9954, 9952, 9955};
Circle(99143) = {9955, 9952, 9956};
Circle(99144) = {9956, 9952, 9953};
Ellipse(99157) = {9951, 9957, 9952, 9954};
Ellipse(99158) = {9951, 9957, 9952, 9953};
Ellipse(99159) = {9951, 9957, 9952, 9956};
Ellipse(99160) = {9951, 9957, 9952, 9955};
Line(99161) = {9954, 9956};
Line(99162) = {9955, 9953};

Line Loop(99175) = {-99125, -99128, -99127, -99126};
Ruled Surface(99176) = {99175};
Line Loop(99177) = {99134, -99129, -99133, 99125};
Ruled Surface(99178) = {99177};
Line Loop(99179) = {-99134, 99126, 99135, -99130};
Ruled Surface(99180) = {99179};
Line Loop(99181) = {99127, 99136, -99131, -99135};
Ruled Surface(99182) = {99181};
Line Loop(99183) = {99133, -99132, -99136, 99128};
Ruled Surface(99184) = {99183};
Line Loop(99185) = {99131, 99132, 99129, 99130};
Ruled Surface(99186) = {99185};
Line Loop(99187) = {99143, 99144, 99141, 99142};
Ruled Surface(99188) = {99187};  /* HGA front */
Line Loop(99189) = {-99157, 99160, -99142};
Ruled Surface(99190) = {99189};  /* HGA */
Line Loop(99191) = {-99158, 99157, -99141};
Ruled Surface(99192) = {99191};  /* HGA */
Line Loop(99193) = {-99159, 99158, -99144};
Ruled Surface(99194) = {99193};  /* HGA */
Line Loop(99195) = {99159, -99143, -99160};
Ruled Surface(99196) = {99195};  /* HGA */



Rotate {{1, 0, 0}, {0, 0, 0}, Pi/2} {
  Surface{99176};
  Surface{99178};
  Surface{99180};
  Surface{99182};
  Surface{99184};
  Surface{99186};
  Surface{99188};
  Surface{99190};
  Surface{99192};
  Surface{99194};
  Surface{99196};
}

Rotate {{0, 0, 1}, {0, 0, 0}, -Pi/2} {
  Surface{99176};
  Surface{99178};
  Surface{99180};
  Surface{99182};
  Surface{99184};
  Surface{99186};
  Surface{99188};
  Surface{99190};
  Surface{99192};
  Surface{99194};
  Surface{99196};
}

Translate {-3.175, 0, 0} {
  Surface{99176};
  Surface{99178};
  Surface{99180};
  Surface{99182};
  Surface{99184};
  Surface{99186};
  Surface{99188};
  Surface{99190};
  Surface{99192};
  Surface{99194};
  Surface{99196};
}

Surface Loop(99001) = {99176,99178,99180,99182,99184,99186};
Surface Loop(99002) = {99188,99190,99192,99194,99196};

//Radiators (Group 90)

rad_group = 9000;
rad_res = SCres/4;

//YP face
rad_Yp_1_Xpos = -0.336;
rad_Yp_1_Zpos = -0.240;
rad_Yp_1_1X = -0.148;
rad_Yp_1_2Z = -0.233;
rad_Yp_1_3X = 0.148;

rad_Yp_2_Xpos = -0.210;
rad_Yp_2_Zpos = -0.694;
rad_Yp_2_1X = -0.238;
rad_Yp_2_2Z = -0.268;
rad_Yp_2_3X = 0.238;

rad_Yp_3_Xpos = -0.235;
rad_Yp_3_Zpos = -1.268;
rad_Yp_3_1X = -0.232;
rad_Yp_3_2Z = -0.557;
rad_Yp_3_3X = -0.025;
rad_Yp_3_4Z = -0.200;
rad_Yp_3_5X = 0.277;
rad_Yp_3_6Z = 0.433;
rad_Yp_3_7X = -0.02;

rad_Yp_4a_Xpos = 0+0.01;
rad_Yp_4a_Ypos = 0-0.01;
rad_Yp_4a_Zpos = -0.259;
rad_Yp_4a_1X = 0.146;
rad_Yp_4a_2Z = -0.534;
rad_Yp_4a_3X = -0.146;

rad_Yp_4b_Xpos = -0.018+0.05;
rad_Yp_4b_Zpos = -1.1+0.05;
rad_Yp_4b_1X = -0.1;
rad_Yp_4b_2Z = -0.1;
rad_Yp_4b_3X = 0.1;

rad_Yp_5_Xpos = -0.744;
rad_Yp_5_Zpos = -0.178;
rad_Yp_5_1X = -1.019;
rad_Yp_5_2Z = -0.194;
rad_Yp_5_3X = 1.019;

rad_Yp_6_Xpos = -0.825;
rad_Yp_6_Zpos = -0.526;
rad_Yp_6_1X = -0.793;
rad_Yp_6_2Z = -0.162;
rad_Yp_6_3X = -0.154;
rad_Yp_6_4Z = -0.259;
rad_Yp_6_5X = 0.154;
rad_Yp_6_6Z = -0.097;
rad_Yp_6_7X = 0.057;
rad_Yp_6_8Z = -0.129;
rad_Yp_6_9X = 0.204;
rad_Yp_6_10Z = 0.129;
rad_Yp_6_11X = 0.100;
rad_Yp_6_12Z = 0.113;
rad_Yp_6_13X = 0.180;
rad_Yp_6_14Z = -0.113;
rad_Yp_6_15X = 0.250;
rad_Yp_6_16Z = 0.138;
rad_Yp_6_17X = 0.178;
rad_Yp_6_18Z = 0.134;
rad_Yp_6_19X = -0.178;

rad_Yp_7_Xpos = -0.760;
rad_Yp_7_Zpos = -1.230;
rad_Yp_7_1X = -0.259;
rad_Yp_7_2Z = -0.235;
rad_Yp_7_3X = 0.259;

rad_Yp_8_Xpos = -1.189;
rad_Yp_8_Zpos = -1.310;
rad_Yp_8_1X = -0.388;
rad_Yp_8_2Z = -0.372;
rad_Yp_8_3X = 0.388;

rad_Yp_9_Xpos = -1.035;
rad_Yp_9_Zpos = -1.763;
rad_Yp_9_1X = -0.324;
rad_Yp_9_2Z = -0.275;
rad_Yp_9_3X = 0.324;

rad_Yp_10_Xpos = -1.456;
rad_Yp_10_Zpos = -1.747;
rad_Yp_10_1X = -0.413;
rad_Yp_10_2Z = -0.437;
rad_Yp_10_3X = 0.323;
rad_Yp_10_4Z = 0.178;
rad_Yp_10_5X = 0.080;


X=SCrefx+rad_Yp_1_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_1_Zpos;
Point(rad_group+1) = {X, Y, Z, rad_res};
X=X+rad_Yp_1_1X;
Point(rad_group+2) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_1_2Z;
Point(rad_group+3) = {X, Y, Z, rad_res};
X=X+rad_Yp_1_3X;
Point(rad_group+4) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_2_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_2_Zpos;
Point(rad_group+5) = {X, Y, Z, rad_res};
X=X+rad_Yp_2_1X;
Point(rad_group+6) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_2_2Z;
Point(rad_group+7) = {X, Y, Z, rad_res};
X=X+rad_Yp_2_3X;
Point(rad_group+8) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_3_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_3_Zpos;
Point(rad_group+9) = {X, Y, Z, rad_res};
X=X+rad_Yp_3_1X;
Point(rad_group+10) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_3_2Z;
Point(rad_group+11) = {X, Y, Z, rad_res};
X=X+rad_Yp_3_3X;
Point(rad_group+12) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_3_4Z;
Point(rad_group+13) = {X, Y, Z, rad_res};
X=X+rad_Yp_3_5X;
Point(rad_group+14) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_3_6Z;
Point(rad_group+15) = {X, Y, Z, rad_res};
X=X+rad_Yp_3_7X;
Point(rad_group+16) = {X, Y, Z, rad_res};


X=SCrefx+rad_Yp_4b_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_4b_Zpos;
Point(rad_group+123) = {X, Y, Z, rad_res};
X=X+rad_Yp_4b_1X;
Point(rad_group+124) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_4b_2Z;
Point(rad_group+125) = {X, Y, Z, rad_res};
X=X+rad_Yp_4b_3X;
Point(rad_group+168) = {X, Y, Z, rad_res};


X=SCrefx+rad_Yp_6_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_6_Zpos;
Point(rad_group+126) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_1X;
Point(rad_group+127) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_2Z;
Point(rad_group+128) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_3X;
Point(rad_group+129) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_4Z;
Point(rad_group+130) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_5X;
Point(rad_group+131) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_6Z;
Point(rad_group+132) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_7X;
Point(rad_group+133) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_8Z;
Point(rad_group+134) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_9X;
Point(rad_group+135) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_10Z;
Point(rad_group+136) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_11X;
Point(rad_group+137) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_12Z;
Point(rad_group+138) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_13X;
Point(rad_group+139) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_14Z;
Point(rad_group+140) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_15X;
Point(rad_group+141) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_16Z;
Point(rad_group+142) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_17X;
Point(rad_group+143) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_6_18Z;
Point(rad_group+144) = {X, Y, Z, rad_res};
X=X+rad_Yp_6_19X;
Point(rad_group+145) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_5_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_5_Zpos;
Point(rad_group+146) = {X, Y, Z, rad_res};
X=X+rad_Yp_5_1X;
Point(rad_group+147) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_5_2Z;
Point(rad_group+148) = {X, Y, Z, rad_res};
X=X+rad_Yp_5_3X;
Point(rad_group+149) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_7_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_7_Zpos;
Point(rad_group+150) = {X, Y, Z, rad_res};
X=X+rad_Yp_7_1X;
Point(rad_group+151) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_7_2Z;
Point(rad_group+152) = {X, Y, Z, rad_res};
X=X+rad_Yp_7_3X;
Point(rad_group+153) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_8_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_8_Zpos;
Point(rad_group+154) = {X, Y, Z, rad_res};
X=X+rad_Yp_8_1X;
Point(rad_group+155) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_8_2Z;
Point(rad_group+156) = {X, Y, Z, rad_res};
X=X+rad_Yp_8_3X;
Point(rad_group+157) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_9_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_9_Zpos;
Point(rad_group+158) = {X, Y, Z, rad_res};
X=X+rad_Yp_9_1X;
Point(rad_group+159) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_9_2Z;
Point(rad_group+160) = {X, Y, Z, rad_res};
X=X+rad_Yp_9_3X;
Point(rad_group+161) = {X, Y, Z, rad_res};

X=SCrefx+rad_Yp_10_Xpos;
Y=SCrefy;
Z=SCrefz+rad_Yp_10_Zpos;
Point(rad_group+162) = {X, Y, Z, rad_res};
X=X+rad_Yp_10_1X;
Point(rad_group+163) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_10_2Z;
Point(rad_group+164) = {X, Y, Z, rad_res};
X=X+rad_Yp_10_3X;
Point(rad_group+165) = {X, Y, Z, rad_res};
Z=Z+rad_Yp_10_4Z;
Point(rad_group+166) = {X, Y, Z, rad_res};
X=X+rad_Yp_10_5X;
Point(rad_group+167) = {X, Y, Z, rad_res};

rad_res=SCres/4;

Line(rad_group+1) = {rad_group+1, rad_group+2};
Line(rad_group+2) = {rad_group+2, rad_group+3};
Line(rad_group+3) = {rad_group+3, rad_group+4};
Line(rad_group+4) = {rad_group+4, rad_group+1};

Line(rad_group+5) = {rad_group+5, rad_group+6};
Line(rad_group+6) = {rad_group+6, rad_group+7};
Line(rad_group+7) = {rad_group+7, rad_group+8};
Line(rad_group+8) = {rad_group+8, rad_group+5};

Line(rad_group+9) = {rad_group+9, rad_group+10};
Line(rad_group+10) = {rad_group+10, rad_group+11};
Line(rad_group+11) = {rad_group+11, rad_group+12};
Line(rad_group+12) = {rad_group+12, rad_group+13};
Line(rad_group+13) = {rad_group+13, rad_group+14};
Line(rad_group+14) = {rad_group+14, rad_group+15};
Line(rad_group+15) = {rad_group+15, rad_group+16};
Line(rad_group+16) = {rad_group+16, rad_group+9};

Line(rad_group+129) = {rad_group+123, rad_group+124};
Line(rad_group+130) = {rad_group+124, rad_group+125};
Line(rad_group+131) = {rad_group+125, rad_group+168};
Line(rad_group+174) = {rad_group+168, rad_group+123};

Line(rad_group+132) = {rad_group+126, rad_group+127};
Line(rad_group+133) = {rad_group+127, rad_group+128};
Line(rad_group+134) = {rad_group+128, rad_group+129};
Line(rad_group+135) = {rad_group+129, rad_group+130};
Line(rad_group+136) = {rad_group+130, rad_group+131};
Line(rad_group+137) = {rad_group+131, rad_group+132};
Line(rad_group+138) = {rad_group+132, rad_group+133};
Line(rad_group+139) = {rad_group+133, rad_group+134};
Line(rad_group+140) = {rad_group+134, rad_group+135};
Line(rad_group+141) = {rad_group+135, rad_group+136};
Line(rad_group+142) = {rad_group+136, rad_group+137};
Line(rad_group+143) = {rad_group+137, rad_group+138};
Line(rad_group+144) = {rad_group+138, rad_group+139};
Line(rad_group+145) = {rad_group+139, rad_group+140};
Line(rad_group+146) = {rad_group+140, rad_group+141};
Line(rad_group+147) = {rad_group+141, rad_group+142};
Line(rad_group+148) = {rad_group+142, rad_group+143};
Line(rad_group+149) = {rad_group+143, rad_group+144};
Line(rad_group+150) = {rad_group+144, rad_group+145};
Line(rad_group+151) = {rad_group+145, rad_group+126};

Line(rad_group+152) = {rad_group+146, rad_group+147};
Line(rad_group+153) = {rad_group+147, rad_group+148};
Line(rad_group+154) = {rad_group+148, rad_group+149};
Line(rad_group+155) = {rad_group+149, rad_group+146};

Line(rad_group+156) = {rad_group+150, rad_group+151};
Line(rad_group+157) = {rad_group+151, rad_group+152};
Line(rad_group+158) = {rad_group+152, rad_group+153};
Line(rad_group+159) = {rad_group+153, rad_group+150};

Line(rad_group+160) = {rad_group+154, rad_group+155};
Line(rad_group+161) = {rad_group+155, rad_group+156};
Line(rad_group+162) = {rad_group+156, rad_group+157};
Line(rad_group+163) = {rad_group+157, rad_group+154};

Line(rad_group+164) = {rad_group+158, rad_group+159};
Line(rad_group+165) = {rad_group+159, rad_group+160};
Line(rad_group+166) = {rad_group+160, rad_group+161};
Line(rad_group+167) = {rad_group+161, rad_group+158};

Line(rad_group+168) = {rad_group+162, rad_group+163};
Line(rad_group+169) = {rad_group+163, rad_group+164};
Line(rad_group+170) = {rad_group+164, rad_group+165};
Line(rad_group+171) = {rad_group+165, rad_group+166};
Line(rad_group+172) = {rad_group+166, rad_group+167};
Line(rad_group+173) = {rad_group+167, rad_group+162};

Line Loop(rad_group+1) = {rad_group+1, rad_group+2, rad_group+3, rad_group+4};
Line Loop(rad_group+2) = {rad_group+5, rad_group+6, rad_group+7, rad_group+8};
Line Loop(rad_group+3) = {rad_group+9, rad_group+10, rad_group+11, rad_group+12,rad_group+13, rad_group+14, rad_group+15, rad_group+16};
Line Loop(rad_group+22) = {rad_group+129, rad_group+130, rad_group+131, rad_group+174};
Line Loop(rad_group+23) = {rad_group+132, rad_group+133, rad_group+134, rad_group+135, rad_group+136, rad_group+137, rad_group+138, rad_group+139, rad_group+140, rad_group+141, rad_group+142, rad_group+143, rad_group+144, //
                           rad_group+145, rad_group+146, rad_group+147, rad_group+148, rad_group+149, rad_group+150, rad_group+151};
Line Loop(rad_group+24) = {rad_group+152, rad_group+153, rad_group+154, rad_group+155};
Line Loop(rad_group+25) = {rad_group+156, rad_group+157, rad_group+158, rad_group+159};
Line Loop(rad_group+26) = {rad_group+160, rad_group+161, rad_group+162, rad_group+163};
Line Loop(rad_group+27) = {rad_group+164, rad_group+165, rad_group+166, rad_group+167};
Line Loop(rad_group+28) = {rad_group+168, rad_group+169, rad_group+170, rad_group+171, rad_group+172, rad_group+173};

Plane Surface(rad_group+1) = {rad_group+1};
Plane Surface(rad_group+2) = {rad_group+2};
Plane Surface(rad_group+3) = {rad_group+3};
Plane Surface(rad_group+22) = {rad_group+22};
Plane Surface(rad_group+23) = {rad_group+23};
Plane Surface(rad_group+24) = {rad_group+24};
Plane Surface(rad_group+25) = {rad_group+25};
Plane Surface(rad_group+26) = {rad_group+26};
Plane Surface(rad_group+27) = {rad_group+27};
Plane Surface(rad_group+28) = {rad_group+28};


//YM face
rad_Ym_1_Xpos = -0.256;
rad_Ym_1_Zpos = -0.141;
rad_Ym_1_1X = -0.236;
rad_Ym_1_2Z = -0.065;
rad_Ym_1_3X = -0.406;
rad_Ym_1_4Z = -0.243;
rad_Ym_1_5X = -0.504;
rad_Ym_1_6Z = 0.117;
rad_Ym_1_7X = -0.083;
rad_Ym_1_7Z = 0.069;
rad_Ym_1_8Z = 0.091;
rad_Ym_1_9X = -0.092;
rad_Ym_1_10Z = -0.114;
rad_Ym_1_11X = -0.166;
rad_Ym_1_12Z = -0.188;
rad_Ym_1_13X = 0.149;
rad_Ym_1_14Z = -0.242;
rad_Ym_1_15X = -0.074;
rad_Ym_1_16Z = -0.305;
rad_Ym_1_17X = 0.555;
rad_Ym_1_18Z = 0.050;
rad_Ym_1_19X = 0.345;
rad_Ym_1_20Z = 0.392;
rad_Ym_1_21X = 0.295;
rad_Ym_1_22Z = -0.442;
rad_Ym_1_23X = 0.220;

rad_Ym_2_Xpos = -0.839;
rad_Ym_2_Zpos = -1.295;
rad_Ym_2_1X = -0.666;
rad_Ym_2_2Z = -0.061;
rad_Ym_2_3X = -0.054;
rad_Ym_2_4Z = -0.578;
rad_Ym_2_5X = 0.054;
rad_Ym_2_6Z = -0.061;
rad_Ym_2_7X = 0.666;
rad_Ym_2_8Z = 0.061;
rad_Ym_2_9X = 0.054;
rad_Ym_2_10Z = 0.578;
rad_Ym_2_11X = -0.054;

rad_Ym_3_Xpos = -0.170;
rad_Ym_3_Zpos = -1.1191;
rad_Ym_3_1X = -0.330;
rad_Ym_3_2Z = -0.144;
rad_Ym_3_3X = 0.330;

rad_Ym_4_Xpos = -0.312;
rad_Ym_4_Zpos = -1.942;
rad_Ym_4_1X = -0.358;
rad_Ym_4_2Z = -0.088;
rad_Ym_4_3X = 0.358;

rad_Ym_6_Xpos = -0.018+0.05;
rad_Ym_6_Zpos = -1.1+0.05;
rad_Ym_6_1X = -0.1;
rad_Ym_6_2Z = -0.1;
rad_Ym_6_3X = 0.1;

X=SCrefx+rad_Ym_1_Xpos;
Y=SCrefy - SCdimY;
Z=SCrefz+rad_Ym_1_Zpos;
Point(rad_group+17) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_1X;
Point(rad_group+18) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_2Z;
Point(rad_group+19) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_3X;
Point(rad_group+20) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_4Z;
Point(rad_group+21) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_5X;
Point(rad_group+22) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_6Z;
Point(rad_group+23) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_7X;
Z=Z+rad_Ym_1_7Z;
Point(rad_group+24) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_8Z;
Point(rad_group+25) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_9X;
Point(rad_group+26) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_10Z;
Point(rad_group+27) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_11X;
Point(rad_group+28) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_12Z;
Point(rad_group+29) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_13X;
Point(rad_group+30) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_14Z;
Point(rad_group+31) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_15X;
Point(rad_group+32) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_16Z;
Point(rad_group+33) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_17X;
Point(rad_group+34) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_18Z;
Point(rad_group+35) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_19X;
Point(rad_group+36) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_20Z;
Point(rad_group+37) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_21X;
Point(rad_group+38) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_1_22Z;
Point(rad_group+39) = {X, Y, Z, rad_res};
X=X+rad_Ym_1_23X;
Point(rad_group+40) = {X, Y, Z, rad_res};

X=SCrefx+rad_Ym_2_Xpos;
Y=SCrefy - SCdimY;
Z=SCrefz+rad_Ym_2_Zpos;
Point(rad_group+41) = {X, Y, Z, rad_res};
X=X+rad_Ym_2_1X;
Point(rad_group+42) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_2_2Z;
Point(rad_group+43) = {X, Y, Z, rad_res};
X=X+rad_Ym_2_3X;
Point(rad_group+44) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_2_4Z;
Point(rad_group+45) = {X, Y, Z, rad_res};
X=X+rad_Ym_2_5X;
Point(rad_group+46) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_2_6Z;
Point(rad_group+47) = {X, Y, Z, rad_res};
X=X+rad_Ym_2_7X;
Point(rad_group+48) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_2_8Z;
Point(rad_group+49) = {X, Y, Z, rad_res};
X=X+rad_Ym_2_9X;
Point(rad_group+50) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_2_10Z;
Point(rad_group+51) = {X, Y, Z, rad_res};
X=X+rad_Ym_2_11X;
Point(rad_group+52) = {X, Y, Z, rad_res};

X=SCrefx+rad_Ym_3_Xpos;
Y=SCrefy - SCdimY;
Z=SCrefz+rad_Ym_2_Zpos;
Point(rad_group+53) = {X, Y, Z, rad_res};
X=X+rad_Ym_3_1X;
Point(rad_group+54) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_3_2Z;
Point(rad_group+55) = {X, Y, Z, rad_res};
X=X+rad_Ym_3_3X;
Point(rad_group+56) = {X, Y, Z, rad_res};

X=SCrefx+rad_Ym_4_Xpos;
Y=SCrefy - SCdimY;
Z=SCrefz+rad_Ym_4_Zpos;
Point(rad_group+57) = {X, Y, Z, rad_res};
X=X+rad_Ym_4_1X;
Point(rad_group+58) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_4_2Z;
Point(rad_group+59) = {X, Y, Z, rad_res};
X=X+rad_Ym_4_3X;
Point(rad_group+60) = {X, Y, Z, rad_res};

X=SCrefx+rad_Ym_6_Xpos;
Y=SCrefy - SCdimY;
Z=SCrefz+rad_Ym_6_Zpos;
Point(rad_group+190) = {X, Y, Z, rad_res};
X=X+rad_Ym_6_1X;
Point(rad_group+191) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_6_2Z;
Point(rad_group+192) = {X, Y, Z, rad_res};
X=X+rad_Ym_6_3X;
Point(rad_group+193) = {X, Y, Z, rad_res};

Line(rad_group+17) = {rad_group+17, rad_group+18};
Line(rad_group+18) = {rad_group+18, rad_group+19};
Line(rad_group+19) = {rad_group+19, rad_group+20};
Line(rad_group+20) = {rad_group+20, rad_group+21};
Line(rad_group+21) = {rad_group+21, rad_group+22};
Line(rad_group+22) = {rad_group+22, rad_group+23};
Line(rad_group+23) = {rad_group+23, rad_group+24};
Line(rad_group+24) = {rad_group+24, rad_group+25};
Line(rad_group+25) = {rad_group+25, rad_group+26};
Line(rad_group+26) = {rad_group+26, rad_group+27};
Line(rad_group+27) = {rad_group+27, rad_group+28};
Line(rad_group+28) = {rad_group+28, rad_group+29};
Line(rad_group+29) = {rad_group+29, rad_group+30};
Line(rad_group+30) = {rad_group+30, rad_group+31};
Line(rad_group+31) = {rad_group+31, rad_group+32};
Line(rad_group+32) = {rad_group+32, rad_group+33};
Line(rad_group+33) = {rad_group+33, rad_group+34};
Line(rad_group+34) = {rad_group+34, rad_group+35};
Line(rad_group+35) = {rad_group+35, rad_group+36};
Line(rad_group+36) = {rad_group+36, rad_group+37};
Line(rad_group+37) = {rad_group+37, rad_group+38};
Line(rad_group+38) = {rad_group+38, rad_group+39};
Line(rad_group+39) = {rad_group+39, rad_group+40};
Line(rad_group+40) = {rad_group+40, rad_group+17};

Line(rad_group+41) = {rad_group+41, rad_group+42};
Line(rad_group+42) = {rad_group+42, rad_group+43};
Line(rad_group+43) = {rad_group+43, rad_group+44};
Line(rad_group+44) = {rad_group+44, rad_group+45};
Line(rad_group+45) = {rad_group+45, rad_group+46};
Line(rad_group+46) = {rad_group+46, rad_group+47};
Line(rad_group+47) = {rad_group+47, rad_group+48};
Line(rad_group+48) = {rad_group+48, rad_group+49};
Line(rad_group+49) = {rad_group+49, rad_group+50};
Line(rad_group+50) = {rad_group+50, rad_group+51};
Line(rad_group+51) = {rad_group+51, rad_group+52};
Line(rad_group+52) = {rad_group+52, rad_group+41};

Line(rad_group+53) = {rad_group+53, rad_group+54};
Line(rad_group+54) = {rad_group+54, rad_group+55};
Line(rad_group+55) = {rad_group+55, rad_group+56};
Line(rad_group+56) = {rad_group+56, rad_group+53};

Line(rad_group+57) = {rad_group+57, rad_group+58};
Line(rad_group+58) = {rad_group+58, rad_group+59};
Line(rad_group+59) = {rad_group+59, rad_group+60};
Line(rad_group+60) = {rad_group+60, rad_group+57};

Line(rad_group+125) = {rad_group+190, rad_group+191};
Line(rad_group+126) = {rad_group+191, rad_group+192};
Line(rad_group+127) = {rad_group+192, rad_group+193};
Line(rad_group+128) = {rad_group+193, rad_group+190};

Line Loop(rad_group+4) = {rad_group+17, rad_group+18, rad_group+19, rad_group+20, rad_group+21, rad_group+22, rad_group+23, rad_group+24, rad_group+25, rad_group+26, rad_group+27, rad_group+28, //
                          rad_group+29, rad_group+30, rad_group+31, rad_group+32, rad_group+33, rad_group+34, rad_group+35, rad_group+36, rad_group+37, rad_group+38, rad_group+39, rad_group+40};

Line Loop(rad_group+5) = {rad_group+41, rad_group+42, rad_group+43, rad_group+44, rad_group+45, rad_group+46, rad_group+47, rad_group+48, rad_group+49, rad_group+50, rad_group+51, rad_group+52};

Line Loop(rad_group+6) = {rad_group+53, rad_group+54, rad_group+55, rad_group+56};

Line Loop(rad_group+7) = {rad_group+57, rad_group+58, rad_group+59, rad_group+60};

Line Loop(rad_group+21) = {rad_group+125, rad_group+126, rad_group+127, rad_group+128};

Plane Surface(rad_group+4) = {rad_group+4};

Plane Surface(rad_group+5) = {rad_group+5};

Plane Surface(rad_group+6) = {rad_group+6};

Plane Surface(rad_group+7) = {rad_group+7};

Plane Surface(rad_group+21) = {rad_group+21};


//Ym shifted Radiator
rad_Ym_5_Xpos = -1.994;
rad_Ym_5_Ypos = -0.277;
rad_Ym_5_Zpos = -0.895;

rad_Ym_5_1X = -0.176;
rad_Ym_5_2Z = -0.535;
rad_Ym_5_3X = 0.143;
rad_Ym_5_4Z = 0.034;
rad_Ym_5_5X = 0.033;

X=SCrefx+rad_Ym_5_Xpos;
Y=SCrefy - SCdimY + rad_Ym_5_Ypos ;
Z=SCrefz+rad_Ym_5_Zpos;
Point(rad_group+61) = {X, Y, Z, rad_res};
X=X+rad_Ym_5_1X;
Point(rad_group+62) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_5_2Z;
Point(rad_group+63) = {X, Y, Z, rad_res};
X=X+rad_Ym_5_3X;
Point(rad_group+64) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_5_4Z;
Point(rad_group+65) = {X, Y, Z, rad_res};
X=X+rad_Ym_5_5X;
Point(rad_group+66) = {X, Y, Z, rad_res};


X=SCrefx+rad_Ym_5_Xpos;
Y=SCrefy - SCdimY + rad_Ym_5_Ypos + 0.1 ;
Z=SCrefz+rad_Ym_5_Zpos;
Point(rad_group+67) = {X, Y, Z, rad_res};
X=X+rad_Ym_5_1X;
Point(rad_group+68) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_5_2Z;
Point(rad_group+69) = {X, Y, Z, rad_res};
X=X+rad_Ym_5_3X;
Point(rad_group+70) = {X, Y, Z, rad_res};
Z=Z+rad_Ym_5_4Z;
Point(rad_group+71) = {X, Y, Z, rad_res};
X=X+rad_Ym_5_5X;
Point(rad_group+72) = {X, Y, Z, rad_res};


Line(rad_group+61) = {rad_group+61, rad_group+62};
Line(rad_group+62) = {rad_group+62, rad_group+63};
Line(rad_group+63) = {rad_group+63, rad_group+64};
Line(rad_group+64) = {rad_group+64, rad_group+65};
Line(rad_group+65) = {rad_group+65, rad_group+66};
Line(rad_group+66) = {rad_group+66, rad_group+61};

Line(rad_group+67) = {rad_group+67, rad_group+68};
Line(rad_group+68) = {rad_group+68, rad_group+69};
Line(rad_group+69) = {rad_group+69, rad_group+70};
Line(rad_group+70) = {rad_group+70, rad_group+71};
Line(rad_group+71) = {rad_group+71, rad_group+72};
Line(rad_group+72) = {rad_group+72, rad_group+67};

Line(rad_group+73) = {rad_group+61, rad_group+67};
Line(rad_group+74) = {rad_group+62, rad_group+68};
Line(rad_group+75) = {rad_group+63, rad_group+69};
Line(rad_group+76) = {rad_group+64, rad_group+70};
Line(rad_group+77) = {rad_group+65, rad_group+71};
Line(rad_group+78) = {rad_group+66, rad_group+72};

Line Loop(rad_group+8) = {rad_group+61, rad_group+62, rad_group+63, rad_group+64, rad_group+65, rad_group+66};

Line Loop(rad_group+9) = {-(rad_group+67), -(rad_group+72), -(rad_group+71), -(rad_group+70), -(rad_group+69), -(rad_group+68)};

Line Loop(rad_group+10) = {-(rad_group+73), -(rad_group+66), rad_group+78, rad_group+72};
Line Loop(rad_group+11) = {rad_group+73, rad_group+67, -(rad_group+74), -(rad_group+61)};
Line Loop(rad_group+12) = {rad_group+74, rad_group+68, -(rad_group+75), -(rad_group+62)};
Line Loop(rad_group+13) = {rad_group+75, rad_group+69, -(rad_group+76), -(rad_group+63)};
Line Loop(rad_group+14) = {rad_group+76, rad_group+70, -(rad_group+77), -(rad_group+64)};
Line Loop(rad_group+15) = {rad_group+77, rad_group+71, -(rad_group+78), -(rad_group+65)};

Plane Surface(rad_group+8) = {rad_group+8};

Plane Surface(rad_group+9) = {rad_group+9};
Plane Surface(rad_group+10) = {rad_group+10};
Plane Surface(rad_group+11) = {rad_group+11};
Plane Surface(rad_group+12) = {rad_group+12};
Plane Surface(rad_group+13) = {rad_group+13};
Plane Surface(rad_group+14) = {rad_group+14};
Plane Surface(rad_group+15) = {rad_group+15};

Surface Loop(rad_group+1) = {rad_group+8, rad_group+9, rad_group+10, rad_group+11, rad_group+12, rad_group+13, rad_group+14, rad_group+15};


//XP face
rad_Xp_1_Ypos = -0.271;
rad_Xp_1_Zpos = -0.729;
rad_Xp_1_1Y = -0.274;
rad_Xp_1_1Z = 0.141;
rad_Xp_1_2Y = -0.642;
rad_Xp_1_3Z = -0.220;
rad_Xp_1_4Y = 0.110;
rad_Xp_1_5Y = 0.095;
rad_Xp_1_5Z = 0.095;
rad_Xp_1_6Y = 0.441;
rad_Xp_1_7Y = 0.156;
rad_Xp_1_7Z = -0.156;
rad_Xp_1_8Y = 0.114;

rad_Xp_2_Ypos = -0.335;
rad_Xp_2_Zpos = -1.521;
rad_Xp_2_1Y = -0.406;
rad_Xp_2_2Z = -0.091;
rad_Xp_2_3Y = -0.150;
rad_Xp_2_4Z = 0.091;
rad_Xp_2_5Y = -0.180;
rad_Xp_2_6Z = -0.054;
rad_Xp_2_7Y = 0.136;
rad_Xp_2_7Z = -0.070;
rad_Xp_2_8Z = -0.126;
rad_Xp_2_9Y = 0.494;
rad_Xp_2_10Z = 0.140;
rad_Xp_2_11Y = 0.105;

X=SCrefx;
Y=SCrefy+rad_Xp_1_Ypos;
Z=SCrefz+rad_Xp_1_Zpos;
Point(rad_group+73) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_1Y;
Z=Z+rad_Xp_1_1Z;
Point(rad_group+74) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_2Y;
Point(rad_group+75) = {X, Y, Z, rad_res};
Z=Z+rad_Xp_1_3Z;
Point(rad_group+76) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_4Y;
Point(rad_group+77) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_5Y;
Z=Z+rad_Xp_1_5Z;
Point(rad_group+78) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_6Y;
Point(rad_group+79) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_7Y;
Z=Z+rad_Xp_1_7Z;
Point(rad_group+80) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_1_8Y;
Point(rad_group+81) = {X, Y, Z, rad_res};

X=SCrefx;
Y=SCrefy+rad_Xp_2_Ypos;
Z=SCrefz+rad_Xp_2_Zpos;
Point(rad_group+82) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_2_1Y;
Point(rad_group+83) = {X, Y, Z, rad_res};
Z=Z+rad_Xp_2_2Z;
Point(rad_group+84) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_2_3Y;
Point(rad_group+85) = {X, Y, Z, rad_res};
Z=Z+rad_Xp_2_4Z;
Point(rad_group+86) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_2_5Y;
Point(rad_group+87) = {X, Y, Z, rad_res};
Z=Z+rad_Xp_2_6Z;
Point(rad_group+88) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_2_7Y;
Z=Z+rad_Xp_2_7Z;
Point(rad_group+89) = {X, Y, Z, rad_res};
Z=Z+rad_Xp_2_8Z;
Point(rad_group+90) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_2_9Y;
Point(rad_group+91) = {X, Y, Z, rad_res};
Z=Z+rad_Xp_2_10Z;
Point(rad_group+92) = {X, Y, Z, rad_res};
Y=Y+rad_Xp_2_11Y;
Point(rad_group+93) = {X, Y, Z, rad_res};

Line(rad_group+79) = {rad_group+73, rad_group+74};
Line(rad_group+80) = {rad_group+74, rad_group+75};
Line(rad_group+81) = {rad_group+75, rad_group+76};
Line(rad_group+82) = {rad_group+76, rad_group+77};
Line(rad_group+83) = {rad_group+77, rad_group+78};
Line(rad_group+84) = {rad_group+78, rad_group+79};
Line(rad_group+85) = {rad_group+79, rad_group+80};
Line(rad_group+86) = {rad_group+80, rad_group+81};
Line(rad_group+87) = {rad_group+81, rad_group+73};

Line(rad_group+88) = {rad_group+82, rad_group+83};
Line(rad_group+89) = {rad_group+83, rad_group+84};
Line(rad_group+90) = {rad_group+84, rad_group+85};
Line(rad_group+91) = {rad_group+85, rad_group+86};
Line(rad_group+92) = {rad_group+86, rad_group+87};
Line(rad_group+93) = {rad_group+87, rad_group+88};
Line(rad_group+94) = {rad_group+88, rad_group+89};
Line(rad_group+95) = {rad_group+89, rad_group+90};
Line(rad_group+96) = {rad_group+90, rad_group+91};
Line(rad_group+97) = {rad_group+91, rad_group+92};
Line(rad_group+98) = {rad_group+92, rad_group+93};
Line(rad_group+99) = {rad_group+93, rad_group+82};

Line Loop(rad_group+16) = {rad_group+79, rad_group+80, rad_group+81, rad_group+82, rad_group+83, rad_group+84, rad_group+85, rad_group+86, rad_group+87};
Line Loop(rad_group+17) = {rad_group+88, rad_group+89, rad_group+90, rad_group+91, rad_group+92, rad_group+93, rad_group+94, rad_group+95, rad_group+96, rad_group+97, rad_group+98, rad_group+99};

Plane Surface(rad_group+16) = {rad_group+16};
Plane Surface(rad_group+17) = {rad_group+17};

//ZP face
rad_res2 = SCres/4;

rad_Zp_1_Xpos = -0.903;
rad_Zp_1_Ypos = -0.064;
rad_Zp_1_1X = -0.521;
rad_Zp_1_2Y = -0.393;
rad_Zp_1_3X = 0.281;
rad_Zp_1_4Y = 0.055;
rad_Zp_1_5X = 0.201;
rad_Zp_1_6Y = 0.198;
rad_Zp_1_7X = 0.040;
rad_Zp_1_8Y = 0.140;

rad_Zp_2_Xpos = -0.940;
rad_Zp_2_Ypos = -0.472;
rad_Zp_2_1X = -0.789;
rad_Zp_2_2Y = -0.232;
rad_Zp_2_3X = 0.190;
rad_Zp_2_4Y = -0.043;
rad_Zp_2_5X = 0.244;
rad_Zp_2_6Y = 0.043;
rad_Zp_2_7X = 0.355;

rad_Zp_3_Xpos = -1.673;
rad_Zp_3_Ypos = -1.055;
rad_Zp_3_1X = -0.096;
rad_Zp_3_2Y = -0.315;
rad_Zp_3_3X = 0.040;
rad_Zp_3_4Y = -0.040;
rad_Zp_3_5X = 0.118;
rad_Zp_3_6Y = 0.140;
rad_Zp_3_7X = -0.062;

X=SCrefx+rad_Zp_1_Xpos;
Y=SCrefy+rad_Zp_1_Ypos;
Z=SCrefz;
Point(rad_group+94) = {X, Y, Z, rad_res2};
X=X+rad_Zp_1_1X;
Point(rad_group+95) = {X, Y, Z, rad_res2};
Y=Y+rad_Zp_1_2Y;
Point(rad_group+96) = {X, Y, Z, rad_res2};
X=X+rad_Zp_1_3X;
Point(rad_group+97) = {X, Y, Z, rad_res2};
Y=Y+rad_Zp_1_4Y;
Point(rad_group+98) = {X, Y, Z, rad_res2};
X=X+rad_Zp_1_5X;
Point(rad_group+99) = {X, Y, Z, rad_res2};
Y=Y+rad_Zp_1_6Y;
Point(rad_group+100) = {X, Y, Z, rad_res2};
X=X+rad_Zp_1_7X;
Point(rad_group+101) = {X, Y, Z, rad_res2};
Y=Y+rad_Zp_1_8Y;
Point(rad_group+102) = {X, Y, Z, rad_res2};

X=SCrefx+rad_Zp_2_Xpos;
Y=SCrefy+rad_Zp_2_Ypos;
Z=SCrefz;
Point(rad_group+103) = {X, Y, Z, rad_res};
X=X+rad_Zp_2_1X;
Point(rad_group+104) = {X, Y, Z, rad_res};
Y=Y+rad_Zp_2_2Y;
Point(rad_group+105) = {X, Y, Z, rad_res};
X=X+rad_Zp_2_3X;
Point(rad_group+106) = {X, Y, Z, rad_res};
Y=Y+rad_Zp_2_4Y;
Point(rad_group+107) = {X, Y, Z, rad_res};
X=X+rad_Zp_2_5X;
Point(rad_group+108) = {X, Y, Z, rad_res};
Y=Y+rad_Zp_2_6Y;
Point(rad_group+109) = {X, Y, Z, rad_res};
X=X+rad_Zp_2_7X;
Point(rad_group+110) = {X, Y, Z, rad_res};

X=SCrefx+rad_Zp_3_Xpos;
Y=SCrefy+rad_Zp_3_Ypos;
Z=SCrefz;
Point(rad_group+111) = {X, Y, Z, rad_res};
X=X+rad_Zp_3_1X;
Point(rad_group+112) = {X, Y, Z, rad_res};
Y=Y+rad_Zp_3_2Y;
Point(rad_group+113) = {X, Y, Z, rad_res};
X=X+rad_Zp_3_3X;
Point(rad_group+114) = {X, Y, Z, rad_res};
Y=Y+rad_Zp_3_4Y;
Point(rad_group+115) = {X, Y, Z, rad_res};
X=X+rad_Zp_3_5X;
Point(rad_group+116) = {X, Y, Z, rad_res};
Y=Y+rad_Zp_3_6Y;
Point(rad_group+117) = {X, Y, Z, rad_res};
X=X+rad_Zp_3_7X;
Point(rad_group+118) = {X, Y, Z, rad_res};



Line(rad_group+100) = {rad_group+94, rad_group+95};
Line(rad_group+101) = {rad_group+95, rad_group+96};
Line(rad_group+102) = {rad_group+96, rad_group+97};
Line(rad_group+103) = {rad_group+97, rad_group+98};
Line(rad_group+104) = {rad_group+98, rad_group+99};
Line(rad_group+105) = {rad_group+99, rad_group+100};
Line(rad_group+106) = {rad_group+100, rad_group+101};
Line(rad_group+107) = {rad_group+101, rad_group+102};
Line(rad_group+108) = {rad_group+102, rad_group+94};

Line(rad_group+109) = {rad_group+103, rad_group+104};
Line(rad_group+110) = {rad_group+104, rad_group+105};
Line(rad_group+111) = {rad_group+105, rad_group+106};
Line(rad_group+112) = {rad_group+106, rad_group+107};
Line(rad_group+113) = {rad_group+107, rad_group+108};
Line(rad_group+114) = {rad_group+108, rad_group+109};
Line(rad_group+115) = {rad_group+109, rad_group+110};
Line(rad_group+116) = {rad_group+110, rad_group+103};

Line(rad_group+117) = {rad_group+111, rad_group+112};
Line(rad_group+118) = {rad_group+112, rad_group+113};
Line(rad_group+119) = {rad_group+113, rad_group+114};
Line(rad_group+120) = {rad_group+114, rad_group+115};
Line(rad_group+121) = {rad_group+115, rad_group+116};
Line(rad_group+122) = {rad_group+116, rad_group+117};
Line(rad_group+123) = {rad_group+117, rad_group+118};
Line(rad_group+124) = {rad_group+118, rad_group+111};

Line Loop(rad_group+18) = {rad_group+100, rad_group+101, rad_group+102, rad_group+103, rad_group+104, rad_group+105, rad_group+106, rad_group+107, rad_group+108};
Line Loop(rad_group+19) = {rad_group+109, rad_group+110, rad_group+111, rad_group+112, rad_group+113, rad_group+114, rad_group+115, rad_group+116};
Line Loop(rad_group+20) = {rad_group+117, rad_group+118, rad_group+119, rad_group+120, rad_group+121, rad_group+122, rad_group+123, rad_group+124};

Plane Surface(rad_group+18) = {rad_group+18};
Plane Surface(rad_group+19) = {rad_group+19};
Plane Surface(rad_group+20) = {rad_group+20};

// Zm face
X0=-2.865;
Y0=-0.76;
Z0=-1.1;
Point(rad_group+169) = {X0-0.1129, Y0+0.630, Z0-0.3721, rad_res};
Point(rad_group+170) = {X0-0.1701, Y0+0.630, Z0-0.3419, rad_res};
Point(rad_group+171) = {X0-0.1935, Y0+0.630, Z0-0.3826, rad_res};
Point(rad_group+172) = {X0-0.1935, Y0+0.450, Z0-0.3826, rad_res};
Point(rad_group+173) = {X0-0.1701, Y0+0.450, Z0-0.3419, rad_res};
Point(rad_group+174) = {X0-0.1129, Y0+0.450, Z0-0.3721, rad_res};

Point(rad_group+175) = {X0-0.1129, Y0+0.630, Z0-0.320, rad_res};
Point(rad_group+176) = {X0-0.1935, Y0+0.630, Z0-0.320, rad_res};
Point(rad_group+177) = {X0-0.1935, Y0+0.450, Z0-0.320, rad_res};
Point(rad_group+178) = {X0-0.1129, Y0+0.450, Z0-0.320, rad_res};

Line(rad_group+175) = {rad_group+169, rad_group+170};
Line(rad_group+176) = {rad_group+170, rad_group+171};
Line(rad_group+177) = {rad_group+171, rad_group+172};
Line(rad_group+178) = {rad_group+172, rad_group+173};
Line(rad_group+179) = {rad_group+173, rad_group+174};
Line(rad_group+180) = {rad_group+174, rad_group+169};
Line(rad_group+181) = {rad_group+170, rad_group+173};

Line(rad_group+182) = {rad_group+175, rad_group+176};
Line(rad_group+183) = {rad_group+176, rad_group+177};
Line(rad_group+184) = {rad_group+177, rad_group+178};
Line(rad_group+185) = {rad_group+178, rad_group+175};

Line(rad_group+186) = {rad_group+169, rad_group+175};
Line(rad_group+187) = {rad_group+171, rad_group+176};
Line(rad_group+188) = {rad_group+172, rad_group+177};
Line(rad_group+189) = {rad_group+174, rad_group+178};

Line Loop(rad_group+29) = {rad_group+175, rad_group+181, rad_group+179, rad_group+180};
Line Loop(rad_group+30) = {rad_group+176, rad_group+177, rad_group+178, -(rad_group+181)};
Line Loop(rad_group+31) = {rad_group+182, rad_group+183, rad_group+184, rad_group+185};
Line Loop(rad_group+32) = {rad_group+186, -(rad_group+185), -(rad_group+189), rad_group+180};
Line Loop(rad_group+33) = {rad_group+175, rad_group+176, rad_group+187, -(rad_group+182), -(rad_group+186)};
Line Loop(rad_group+34) = {rad_group+177, rad_group+188, -(rad_group+183), -(rad_group+187)};
Line Loop(rad_group+35) = {rad_group+178, rad_group+179, rad_group+189, -(rad_group+184), -(rad_group+188)};

Plane Surface(rad_group+29) = {rad_group+29};
Plane Surface(rad_group+30) = {rad_group+30};
Plane Surface(rad_group+31) = {rad_group+31};
Plane Surface(rad_group+32) = {rad_group+32};
Plane Surface(rad_group+33) = {rad_group+33};
Plane Surface(rad_group+34) = {rad_group+34};
Plane Surface(rad_group+35) = {rad_group+35};

Surface Loop(rad_group+2) = {rad_group+29, rad_group+30, rad_group+31, rad_group+32, rad_group+33, rad_group+34, rad_group+35};


//Plane surfaces spacecraft surfaces
Plane Surface(1030) = {1024};
Plane Surface(1032) = {1026};
Plane Surface(1027) = {1021, rad_group+18, rad_group+19, rad_group+20};
Plane Surface(1028) = {1022, 1027, rad_group+16, rad_group+17};
Plane Surface(1029) = {1023, rad_group+4, rad_group+5, rad_group+6, rad_group+7, rad_group+21};
Plane Surface(1031) = {1025, rad_group+1, rad_group+2, rad_group+3, rad_group+22, rad_group+23, rad_group+24, rad_group+25, rad_group+26, rad_group+27, rad_group+28};

Surface Loop(10) = {1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, rad_group+1, rad_group+2, rad_group+3, rad_group+4, //
                    rad_group+5, rad_group+6, rad_group+7, rad_group+16, rad_group+17, rad_group+18, rad_group+19, rad_group+20, rad_group+21, rad_group+22, rad_group+23, //
                    rad_group+24, rad_group+25, rad_group+26, rad_group+27, rad_group+28};
//RPW
Include "RPW.geo";

//Volume

Volume(1000) = {3, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 22, 23, 24, 30, 31, 32, 33, 34, 35, //
                36, 37, 38, 39, 40, 41, 42, 43, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, //
                57, 58, 59, 60, 70, 71, 72, 73, 74, 75, 76, 81, 82, 84, rad_group+1, rad_group+2, 99001, 99002
                /*, 711, 712, //713, 714, 715, 716, 717, 718, 719, 720, 721, 722*/
                };

// Physical Surfaces and volume

// RPW SYSTEM 1
// Boom RPW +Z
Physical Surface("Boom RPW +Z") = {623, 633, 625, 627, 631, 629};
//RPW +Z
Physical Surface("RPW +Z") = {635, 643, 641, 639, 637, 645};
//Sunshield RPW +Z
Physical Surface("Sunshield RPW +Z") = {663, 655, 649, 651, 659, 657, 665, 667, 673, 669, 661, 653, 647, 671};
//Box RPW +Z
Physical Surface("Box RPW +Z") = {677, 675, 683, 685, 679, 681};

// RPW SYSTEM 2
//Boom RPW +Y
Physical Surface("Boom RPW +Y") = {99202,99197,99207,99212,99222,99217};
//RPW +Y
Physical Surface("RPW +Y") = {99232,99227,99237,99247,99242,99252};
//Sunshield RPW +Y
Physical Surface("Sunshield RPW +Y") = {99297,99322,99287,99292,99302,99277,99282,99257,99307,99262,99267,99272,99312,99317};
//Box RPW +Y
Physical Surface("Box RPW +Y") = {99342,99347,99327,99337,99352,99332};

// RPW SYSTEM 3
//Boom RPW -Y
Physical Surface("Boom RPW -Y") = {99358,99378,99368,99353,99363,99373};
//RPW -Y
Physical Surface("RPW -Y") = {99388,99393,99398,99383,99403,99408};
//Sunshield RPW -Y
Physical Surface("Sunshield RPW -Y") = {99453,99478,99443,99458,99448,99413,99438,99463,99433,99423,99418,99428,99468,99473};
//Box RPW -Y
Physical Surface("Box RPW -Y") = {99498,99493,99483,99508,99503,99488};


Physical Surface("SC bus") = {1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041 , 1042, 1043, 1044, 1045, 1046, 1047, 1048};			//S/C bus

//All zero voltage surfaces
Physical Surface("0V surfaces") = {1316, 1317, 1318, 1516, 1517, 1518, 2016, 2017, 2018, 2216, 2217, 2218, 1301, 1302, 1303, 1501, 1502, 1503, 2001, 2002, 2003, 2201, 2202, 2203, 1142, 1242, //
                                   1642, 1742, 1842, 2442, 1942, 2342, 1304, 1305, 1306, 1504, 1505, 1506, 2004, 2005, 2006, 2204, 2205, 2206, 1313, 1314, 1513, 1514, 1515, 2013, 2014, 2015, 2214, 2215, //
                                   1319, 1320, 1519, 1520, 2019, 2020, 2219, 2220, 1145, 1146, 1245, 1246, 1645, 1646, 1745, 1746, 1845, 1846, 1945, 1946, 2345, 2346, //
                                   2445, 2446, 1139, 1239, 1739, 1639, 1839, 2439, 2339, 1939, 7070, 7091, 7095, 7099, 7107, 7111, 7119, 7127, 7131, 7132, 7171, 7184, 7188, 7192, 7196, 7200, 7204, 7208, 7212, 7213, //
                                   7250, 7251, 7252, 7253, 7254, 7255, 7256, 7257, 7350, 7351, 7352, 7353, 7354, 7355, 7356, 7357, 7480, 7490, 7498, 7502, 7506, 7507, 7680, 7682, 7685, 7686, 7687, 7688, 7689, 7690, //
                                   7699, 7703, 7580, 7581, 7582, 7583, 7588, 7589, 7590, 7591, 7593, 7595, 8160, rad_group+9, rad_group+10, rad_group+11, rad_group+12, rad_group+13, rad_group+14, rad_group+15, //
                                   rad_group+31, rad_group+32, rad_group+33, rad_group+34, rad_group+35};


Physical Surface("Radiators") = {7087, 7123, 7115, 7103, rad_group+23, rad_group+24, rad_group+25, rad_group+26, rad_group+27, rad_group+28};
Physical Surface("Non conductive instrument surfaces") = {7592, 7594, 7683, 7684, 7707, 7711, 7712};
Physical Surface("Yokes GND") = {1140, 1240, 1640, 1740};					//Front -100V surfaces
Physical Surface("Yokes GND 2") = {1840, 1940, 2340, 2440, 1307, 1308, 1309, 1507, 1508, 1509, 2007, 2008, 2009, 2207, 2208, 2209, 1143, 1243, 1643, 1743, 1843, 1943, 2343, 2443, 1310, 1311, 1312, 1510, 1511, 1512, 2010, 2011, 2012, 2210, 2211, 2212};
										//All other -100V surfaces

Physical Surface("SA 0V segments") = {1744, 1741, 1841, 1844, 1144, 1141, 2441, 2444, 4581, 4585, 4589, 4681, 4685, 4689, 4781, 4785, 4789, 4881, 4885, 4889, 4981, 4985, 4989, 5081, 5085, 5089, 5180, 5181, 5182, 5183, 5184, 5280, 5281, 5282, 5283, 5284, 5380, 5381, 5382, 5383, 5384, 5480, 5481, 5482, 5483, 5484, 5580, 5581, 5582, 5583, 5584, 5680, 5681, 5682, 5683, 5684, 5780, 5781, 5782, 5783, 5784, 5880, 5881, 5882, 5883, 5884, 5980, 5981, 5982, 5983, 5984, 6080, 6081, 6082, 6083, 6084, 4586, 4686, 4786, 4886, 4986, 5086};
										//Solar array segments + hinges at 0V

Physical Surface("SA CERS front surfaces") = {4583, 4683, 4783, 4883, 4983, 5083}; //CERS surfaces


Physical Surface("SA Edges Z-axis (no outer edges)") = {4584, 4682, 4684, 4782, 4882, 4984, 4982, 5084};

Physical Surface("SA Outer Edges Z-axis (far SC side)") = {4784, 5082};

Physical Surface("SA Outer Edges Z-axis (near SC side)") = {4582, 4884};

Physical Surface("SA Edges Y-axis") = {4580, 4680, 4780, 4880, 4980, 5080};

Physical Surface("SA Kapton Gaps Z-axis (no outer edges)") = {4588, 4690, 4688, 4790, 4890, 4988, 4990, 5088};

Physical Surface("SA Outer Kapton Gaps Z-axis (far SC side)") = {4788, 5090};

Physical Surface("SA Outer Kapton Gaps Z-axis (near SC side)") = {4590, 4888};

Physical Surface("SA Kapton Gaps Y-axis") = {4587, 4687, 4787, 4887, 4987, 5087};


Physical Surface("-100V surfaces") = {5185, 5285, 5286, 5385, 5485, 5486, 5585, 5586, 5685, 5785, 5786, 5885, 5985, 5986, 6085, 1941, 1944, 2341,  1241, 1641, 7494, 2344, 1644, 1244, rad_group+29, rad_group+30, rad_group+22, rad_group+21};
										//Hinge transfer harness at -100V
Physical Surface("HGA Mast") = {99176,99178,99180,99182,99184,99186};
Physical Surface("HGA") = {99188,99190,99192,99194,99196};


Physical Surface("IBOOM 0V parts") = {3181, 3182, 3186, 3188, 3189, 3080, 3081, 3082, 3083, 3084, 3085, 3086, 3087, 3385, 3280, 3281, 3483, 3580, 3581, 4080, 4081, 4180, 4191, 4195, 4199, 4203, 4207, 4211, 4212, 4182, 4256, 4243, 4247, 4251, 4255, 4181, 4221, 4225, 4229, 4233, 4234};
										//IBoom parts at 0V

Physical Surface("IBOOM upper") = {3582, 3583, 3584, 3585, 3787, 3788, 3785, 3780, 3880, 3881, 3882, 3883, 3884, 3885, 3680, 3681, 3682, 3683, 3684, 3685, 3980, 3981, 3982, 3984, 3985, 3983, 3781, 3782, 3783, 3784, 3786, 3789};

Physical Surface("IBOOM lower") = {4082, 4083, 4084, 4085};

Physical Surface("IBOOM PCBE parts") = {3380, 3381, 3382, 3383, 3384, 3282, 3283, 3284, 3285, 3187, 3185, 3184, 3183, 3180, 3480, 3481, 3482, 3484, 3485};
										//IBOOM PCB painted parts

Physical Surface("Magnetometers MLI") = {8240, 8241, 8244, 8245, 8440, 8441, 8444, 8445};

Physical Surface("MAGIBS Ice") = {8242, 8243};

Physical Surface("MAGOBS Ice") = {8442, 8443};

Physical Surface("EAS Baffle Ice") = {8165, 8161, 8162, 8163, 8164};

Physical Surface("External boundary") = {340, 342, 344, 346, 348, 350, 352, 354};			//External Boundary

Physical Surface("Radiators SC ground") = {rad_group+1, rad_group+2, rad_group+3};
Physical Surface("Yoke shadowed line") = {1315,  2213};
Physical Surface("Radiators OSR") = {rad_group+4, rad_group+5, rad_group+6, rad_group+7, rad_group+8,rad_group+16, rad_group+17, rad_group+18, rad_group+19, rad_group+20};

Physical Volume("Computational volume") = {1000};							//Computational volume


