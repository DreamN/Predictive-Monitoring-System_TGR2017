rgbcolor = imread('rgb.png'); %���ٻ�Ҿ���㹵���� rgbcolor
imshow(rgbcolor) %�ʴ��ػ�Ҿ㹵���� rgbcolor
figure;imshow(rgbcolor);title('RGB COLOR') %//���ҧ��ͺ����ٻ�Ҿ(����� rgbcolor) ���������(RGB COLOR)
rgbcolor(:,:,2)=0; %//������� rgbcolor �絤���� �ҡ������������մ� (Red=1;Green=2;Blue=3;) ��ǹ��� 0 ��ҡѺ�մ� 1 ��ҡѺ�բ�� 
rgbcolor(:,:,3)=0; %//������� rgbcolor �絤���� �ҡ�չ���Թ������մ�
redcolor = rgbcolor; %// ��˹�������� redcolor �դ����ҡѺ rgbcolor
figure;imshow(redcolor);title('RED COLOR')% //���ҧ��ͺ����ٻ�Ҿ(����� redcolor) ���������(RED COLOR)