P=imread('box2.jpg'); %��ҹ��Ҩҡ�Ҿ���ǹ��������㹵������ٻẺ�����ԡ
figure;imshow(P);
P=rgb2gray(P); %�ŧ�Ҿ��(RGB) �����ⷹ����� (���-��-��) (Gray Scale)
figure;imshow(P);
P=im2bw(P,graythresh(P));% �Ҥ�Ҥ���ᵡ��ҧ��Ҿ�ѵ��ѵ� (�ê���) �����ŧ������բ�Ǵ�
figure;imshow(P);
P=~P; %㹢�鹵͹�������������ǹ��������������Ѻ���˹��բ�ǡѺ�մ�
figure;imshow(P);
B = bwboundaries(P); %��˹��ͺࢵ��Ҿ���������㹵����
figure;imshow(P);
text(10,10,strcat('\color{green}������������������:',num2str(length(B)))) % ��¹��ͤ���ŧ���Ҿ



