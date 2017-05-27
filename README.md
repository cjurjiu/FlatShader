# FlatShader
#### A very simple shader which performs flatshading without the need for duplicating vertices when building the geometry.

Standard unity shader      |  FlatShader
:-------------------------:|:-------------------------:
![](https://github.com/cjurjiu/FlatShader/blob/master/img/terrain_normal.PNG)  |  ![](https://github.com/cjurjiu/FlatShader/blob/master/img/terrain_flatshaded.PNG)

This is especially useful on mobile devices, which don't *really* enjoy pushing more vertices than they have to.

The basic idea behind how it works is that it computes a normal at the fragment level, which is then used in a custom lightning function. Original solution posted [here](http://makegamessa.com/discussion/comment/39595/#Comment_39595). Also, this might also prove to be [a useful reference](https://stackoverflow.com/questions/16365385/explanation-of-dfdx).

The shader in this repository is not production ready in any way, and the lightning needs more tweaking. However, it ilustrates the concept.

<img src="https://github.com/cjurjiu/FlatShader/blob/master/img/sphere.PNG" width="50%"/>

Sample project used to create the images in the **FlatShaderSampleProject** folder. The *Materials* folder contains two materials: One uses the standard unity shader, the other uses the FlatShader presented here. 

Just import the project in Unity, open the scene, hit play then swap the materials on the terrain in order to see how this behaves in comparison to the default Unity Standard shader.

Enjoy
