#ifdef LINUX
#include <GL/gl.h>
#endif
#ifdef WIN32
#include "glew.h"
#endif
#ifdef __APPLE__
#include <OpenGL/gl.h>
#endif

#include "SOIL/SOIL.h"

#ifdef WIN32
#include "win32-dirent.h"
#endif

#ifdef LINUX
#include <dirent.h>
#endif

#ifdef MACOS
#include <dirent.h>
#endif

#include "projectM.hpp"
#include "TextureManager.hpp"
#include "Common.hpp"
#include "IdleTextures.hpp"

TextureManager::TextureManager(const std::string _presetURL): presetURL(_presetURL)
{
    Preload();
    loadTextureDir();
}

TextureManager::~TextureManager()
{
    Clear();
}

void TextureManager::Preload()
{
    unsigned int tex;

    tex = SOIL_load_OGL_texture_from_memory(
        M_data,
        M_bytes,
        SOIL_LOAD_AUTO,
        SOIL_CREATE_NEW_ID,
        SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MULTIPLY_ALPHA);

    textures["M.tga"]=tex;

    tex = SOIL_load_OGL_texture_from_memory(
        project_data,
        project_bytes,
        SOIL_LOAD_AUTO,
        SOIL_CREATE_NEW_ID,
        SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MULTIPLY_ALPHA);

    textures["project.tga"]=tex;

    tex = SOIL_load_OGL_texture_from_memory(
        headphones_data,
        headphones_bytes,
        SOIL_LOAD_AUTO,
        SOIL_CREATE_NEW_ID,
        SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MULTIPLY_ALPHA);

    textures["headphones.tga"]=tex;
}

void TextureManager::Clear()
{
    for (std::map<std::string, GLuint>::const_iterator iter = textures.begin(); iter != textures.end(); iter++)
    {
        glDeleteTextures(1,&iter->second);
    }

    textures.clear();
}

void TextureManager::setTexture(const std::string name, const unsigned int texId, const int width, const int height)
{
    textures[name] = texId;
    widths[name] = width;
    heights[name] = height;
}

GLuint TextureManager::getTexture(const std::string filename)
{
    std::string fullURL = presetURL + PATH_SEPARATOR + filename;
    return getTextureFullpath(filename,fullURL);
}

GLuint TextureManager::getTextureFullpath(const std::string filename, const std::string imageURL)
{
    if (textures.find(filename)!= textures.end())
    {
        return textures[filename];
    }
    else
    {
        int width, height;

        unsigned int tex = SOIL_load_OGL_texture_size(
            imageURL.c_str(),
            SOIL_LOAD_AUTO,
            SOIL_CREATE_NEW_ID,
            SOIL_FLAG_MULTIPLY_ALPHA,
            &width,
            &height);

        textures[filename]=tex;
        widths[filename]=width;
        heights[filename]=height;
        return tex;
     }
}

int TextureManager::getTextureWidth(const std::string imageURL)
{
    return widths[imageURL];
}

int TextureManager::getTextureHeight(const std::string imageURL)
{
    return heights[imageURL];
}

unsigned int TextureManager::getTextureMemorySize()
{
    return 0;
}

void TextureManager::loadTextureDir()
{
    std::string dirname = GetProjectMDataDirectory() + "/textures";

    DIR * m_dir;

    // Allocate a new a stream given the current directory name
    if ((m_dir = opendir(dirname.c_str())) == NULL)
    {
        std::cerr<<"No Textures Loaded from "<<dirname<<std::endl;
        return; // no files loaded. m_entries is empty
    }

    struct dirent * dir_entry;

    while ((dir_entry = readdir(m_dir)) != NULL)
    {
        // Convert char * to friendly string
        std::string filename(dir_entry->d_name);

        if (filename.length() > 0 && filename[0] == '.')
        {
            continue;
        }

        // Create full path name
        std::string fullname = dirname + PATH_SEPARATOR + filename;
        unsigned int texId = getTextureFullpath(filename, fullname);

        if(texId != 0)
        {
            user_textures.push_back(texId);
            textures[filename]=texId;
            user_texture_names.push_back(filename);
        }
    }

    if (m_dir)
    {
        closedir(m_dir);
        m_dir = 0;
    }
}

std::string TextureManager::getRandomTextureName(std::string random_id)
{
    if (user_texture_names.size() > 0)
    {
        std::string random_name = user_texture_names[rand() % user_texture_names.size()];
        random_textures.push_back(random_id);
        textures[random_id] = textures[random_name];
        return random_name;
    }

    return "";
}

void TextureManager::clearRandomTextures()
{
    for (std::vector<std::string>::iterator pos = random_textures.begin(); pos != random_textures.end(); ++pos)
    {
        textures.erase(*pos);
        widths.erase(*pos);
        heights.erase(*pos);
    }

    random_textures.clear();
}
