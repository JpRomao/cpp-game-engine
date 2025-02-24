#pragma once

#ifdef ENGINE_PLATFORM_WINDOWS

extern Engine::Application* Engine::CreateApplication();

int main(int argc, char** argv) {
    Engine::Log::Init();
    ENGINE_CORE_WARN("Initialized Log!");
    int a = 1;
    ENGINE_INFO("Initialized Log! Var={0}", a);

    auto app = Engine::CreateApplication();
    app->Run();
    delete app;

    return 0;
}

#endif