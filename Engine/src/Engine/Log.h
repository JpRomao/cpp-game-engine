#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Engine {
    class ENGINE_API Log {
        public:
        static void Init();

        inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() {
            return s_CoreLogger;
        }

        inline static std::shared_ptr<spdlog::logger>& GetClientLogger() {
            return s_ClientLogger;
        }

        private:
        static std::shared_ptr<spdlog::logger> s_CoreLogger;
        static std::shared_ptr<spdlog::logger> s_ClientLogger;
    };
}

// Core log macros
#define ENGINE_CORE_TRACE(...)      ::Engine::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ENGINE_CORE_INFO(...)       ::Engine::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ENGINE_CORE_WARN(...)       ::Engine::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ENGINE_CORE_ERROR(...)      ::Engine::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ENGINE_CORE_CRITICAL(...)   ::Engine::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client log macros
#define ENGINE_TRACE(...)           ::Engine::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ENGINE_INFO(...)            ::Engine::Log::GetClientLogger()->info(__VA_ARGS__)
#define ENGINE_WARN(...)            ::Engine::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ENGINE_ERROR(...)           ::Engine::Log::GetClientLogger()->error(__VA_ARGS__)
#define ENGINE_CRITICAL(...)        ::Engine::Log::GetClientLogger()->critical(__VA_ARGS__)
