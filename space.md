[example query from Star API][exq]
* from Isaac Hinman ([this blog post][ihblag])
* `http://star-api.herokuapp.com/api/v1/stars?max[distly]=20`
   * `max[distly]=20` == max distance in light years: 20
* the sun: { "id":53794, "label":"Sun", "x":0.0, "y":0.0, "z":0.0, "lum":0.8913,
  "colorb_v":0.65, "absmag":4.85, "appmag":-26.72, "texnum":1.0, "distly":0.0,
  "dcalc":0.0, "plx":0.0, "plxerr":0.0, "vx":0.0, "vy":0.0, "vz":0.0,
  "speed":0.0, "hipnum":0.0, "created_at":"2014-11-08T14:49:09.334Z",
  "updated_at":"2014-11-08T14:49:09.334Z" }
* another star: {"id":54179, "label":"HIP439 HD225213 Gli", "x":1.0193,
  "y":-0.2998, "z":-4.2291, "lum":0.00556, "colorb_v":1.542, "absmag":10.36,
  "appmag":8.56, "texnum":1.0, "distly":14.22, "dcalc":1.0, "plx":229.33,
  "plxerr":0.47, "vx":-78.589, "vy":-78.438, "vz":-83.204, "speed":138.75,
  "hipnum":439.0, "created_at":"2014-11-08T14:49:13.425Z",
  "updated_at":"2014-11-08T14:49:13.425Z"}
   * [is it this star?][hip439]
* and another: {"id":54878, "label":"HIP1242 Gli", "x":0.1317, "y":1.2364,
  "z":-5.0617, "lum":0.00053, "colorb_v":-0.63, "absmag":12.9, "appmag":11.49,
  "texnum":1.0, "distly":16.99, "dcalc":1.0, "plx":191.86, "plxerr":8.99,
  "vx":0.0, "vy":0.0, "vz":0.0, "speed":0.0, "hipnum":1242.0,
  "created_at":"2014-11-08T14:49:19.919Z",
  "updated_at":"2014-11-08T14:49:19.919Z"}
   * [is it this star?][hip1242]

[exq]: http://star-api.herokuapp.com/api/v1/stars?max[distly]=20
[ihblag]: https://isaachinman.wordpress.com/2015/06/12/working-with-nasas-star-api-and-socrata/
[hip439]: http://www.astrostudio.org/xhip.php?hip=439
[hip1242]: http://www.astrostudio.org/xhip.php?hip=1242

from Noel Raymond Cower:
* [some words about OpenGL & Ruby][nrcor]
* [her amazing-looking resume][nrcres]

[nrcor]: http://spifftastic.net/post/2013/07/ruby-experiments/
[nrcres]: http://spifftastic.net/resume/
