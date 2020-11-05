class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("");
  sliderModel.setTitle("Wellcome Kabar Nagari App");
  sliderModel.setImageAssetPath("assets/images/onboarding-1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Berita  uptodate ");
  sliderModel.setTitle("Kabar Nagari  App");
  sliderModel.setImageAssetPath("assets/images/onboarding-2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Berbagai Kategori");
  sliderModel.setTitle("Kabar Nagari  App");
  sliderModel.setImageAssetPath("assets/images/onboarding-3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}