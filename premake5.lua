workspace "Engine"
  architecture "x64"

  configurations {
    "Debug",
    "Release",
    "Dist"
  }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Engine"
  location "Engine"
  kind "SharedLib"
  language "C++"

  buildoptions { "/utf-8" }

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  pchheader "enpch.h"
  pchsource "Engine/src/enpch.cpp"

  files {
    "%{prj.name}/src/**.h",
    "%{prj.name}/src/**.cpp"
  }

  includedirs {
    "%{prj.name}/src",
    "%{prj.name}/vendor/spdlog/include"
  }

  filter "system:windows"
    cppdialect "C++17"
    staticruntime "On"
    systemversion "latest"

    defines {
      "ENGINE_PLATFORM_WINDOWS",
      "ENGINE_BUILD_DLL"
    }

    postbuildcommands {
      ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
    }

  filter "configurations:Debug"
    defines "ENGINE_DEBUG"
    symbols "On"

  filter "configurations:Release"
    defines "ENGINE_RELEASE"
    optimize "On"

  filter "configurations:Dist"
    defines "ENGINE_DIST"
    optimize "On"
  
project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    buildoptions { "/utf-8" }
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
      "%{prj.name}/src/**.h",
      "%{prj.name}/src/**.cpp"
    }
  
    includedirs {
      "Engine/vendor/spdlog/include",
      "Engine/src"
    }

    links {
      "Engine"
    }
  
    filter "system:windows"
      cppdialect "C++17"
      staticruntime "On"
      systemversion "latest"
  
      defines {
        "ENGINE_PLATFORM_WINDOWS"
      }
  
    filter "configurations:Debug"
      defines "ENGINE_DEBUG"
      symbols "On"
  
    filter "configurations:Release"
      defines "ENGINE_RELEASE"
      optimize "On"
  
    filter "configurations:Dist"
      defines "ENGINE_DIST"
      optimize "On"
