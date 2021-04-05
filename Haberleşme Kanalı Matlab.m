bit_vector = randi([0, 1], 1, 10);

b1 = bit_vector([1 2]);
b2 = bit_vector([3 4]);
b3 = bit_vector([5 6]);
b4 = bit_vector([7 8]);
b5 = bit_vector([9 10]);

u1 = ((b1(1) == 1)*(b1(2) == 1)*-1 + ((b1(1) == 0)*(b1(2) == 0))*1 + (b1(1)== 1)*(b1(2) == 0)*-1j + (b1(1)== 0)*(b1(2) == 1)*1j);
u2 = ((b2(3) == 1)*(b2(4) == 1)*-1 + ((b2(3) == 0)*(b2(4) == 0))*1 + (b2(3)== 1)*(b2(4) == 0)*-1j + (b2(3)== 0)*(b2(4) == 1)*1j);
u3 = ((b3(5) == 1)*(b3(6) == 1)*-1 + ((b3(5) == 0)*(b3(6) == 0))*1 + (b3(5)== 1)*(b3(6) == 0)*-1j + (b3(5)== 0)*(b3(6) == 1)*1j);
u4 = ((b4(7) == 1)*(b4(8) == 1)*-1 + ((b4(7) == 0)*(b4(8) == 0))*1 + (b4(7)== 1)*(b4(8) == 0)*-1j + (b4(7)== 0)*(b4(8) == 1)*1j);
u5 = ((b5(9) == 1)*(b5(10) == 1)*-1 + ((b5(9) == 0)*(b5(10) == 0))*1 + (b5(9)== 1)*(b5(10) == 0)*-1j + (b5(9)== 0)*(b5(10) == 1)*1j);

s1 = [u1; u1; u1; u1];
s2 = [u2; u2];
s3 = [u3; u3; u3; u3; u3];
s4 = [u4; u4; u4; u4; u4; u4; u4; u4];
s5 = u5;
s = [s1; s2; s3; s4; s5];

H1 =  randn(4, 16) + randn(4, 16)*1i;
H2 =  randn(2, 16) + randn(2, 16)*1i;
H3 =  randn(5, 16) + randn(5, 16)*1i;
H4 =  randn(8, 16) + randn(8, 16)*1i;
h5 =  randn(1, 16) + randn(1, 16)*1i;
H =  [H1; H2; H3; H4; h5];

H1_tilde = [H2; H3; H4; h5];
F1 = null(H1_tilde);

H2_tilde = [H1; H3; H4; h5];
F2 = null(H2_tilde);

H3_tilde = [H1; H2; H4; h5];
F3 = null(H3_tilde);

H4_tilde = [H1; H2; H3; h5];
F4 = null(H4_tilde);

h5_tilde = [H1; H2; H3; H4];
F5 = null(h5_tilde);

F = [F1 F2 F3 F4 F5];

GucH1= sum(sum(H1 .* H1));
GucH2= sum(sum(H2 .* H2));
GucH3= sum(sum(H3 .* H3));
GucH4= sum(sum(H4 .* H4));
Guch5= sum(sum(h5 .* h5));


m1 = H* (sqrt(1/GucH1));
m2 = H* (sqrt(1/GucH2));
m3 = H* (sqrt(1/GucH3));
m4 = H* (sqrt(1/GucH4));
m5 = H* (sqrt(1/Guch5));