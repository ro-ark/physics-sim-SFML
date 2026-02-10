SFML_PATH := $(HOME)/sfml_install

CXX      := g++
CXXFLAGS := -std=c++17 -Wall -I$(SFML_PATH)/include -I./libs/imgui-1.91.1 -I./libs/imgui-sfml
LDFLAGS  := -L$(SFML_PATH)/lib -lsfml-graphics -lsfml-window -lsfml-system -framework OpenGL

IMGUI_SRC := libs/imgui-1.91.1/imgui.cpp \
             libs/imgui-1.91.1/imgui_draw.cpp \
             libs/imgui-1.91.1/imgui_widgets.cpp \
             libs/imgui-1.91.1/imgui_tables.cpp \
             libs/imgui-sfml/imgui-SFML.cpp 

TARGET   := sfml-app
SRC      := main.cpp $(IMGUI_SRC)

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(SRC) -o $(TARGET) $(CXXFLAGS) $(LDFLAGS)

run: all
	export DYLD_LIBRARY_PATH=$(SFML_PATH)/lib:$$DYLD_LIBRARY_PATH && ./$(TARGET)

clean:
	rm -f $(TARGET)
