  CC=g++
TARGET=vps
CPPFLAGS=--std=c++11
GTK3_FLAGS=`pkg-config --cflags gtk+-3.0`
GTK3_LIBS=`pkg-config --libs gtk+-3.0`
OPENCV_FLAGS=`pkg-config opencv4 --cflags`
OPENCV_INC=-I /usr/local/include/opencv4

LDLIBS=-L /usr/local/lib -lopencv_core -lopencv_imgcodecs -lopencv_imgproc -lopencv_videoio -lpthread -lavformat -lavcodec -lavutil -lswscale

OBJS=main.o 

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(GTK3_LIBS)
	rm -f *.o

main.o: main.cpp
	$(CC) -c main.cpp $(CPPFLAGS) $(GTK3_FLAGS)
clean:
	rm -f $(TARGET)t