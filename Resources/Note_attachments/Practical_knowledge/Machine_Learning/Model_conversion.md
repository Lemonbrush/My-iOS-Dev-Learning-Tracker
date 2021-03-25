# Model conversion

![image](https://github.com/Lemonbrush/My-iOS-Dev-Learning-Tracker/blob/main/Resources/Images/Other/CoreML_Convertion.png)

In order to convert prelearned models such as Caffe, Keras, e.t.c. into .mlmodel file extension you have to do so with convertor that you can install via PIP.

PIP - package management system that helps you install packages

### How to install PIP

**0)** Install python if needed 

`brew install python`

**1)** Save [**this**](https://bootstrap.pypa.io/pip/2.7/get-pip.py) file

**2)** **cd** to this file and install it with 

`sudo python get-pip.py`   

**3)** Finally, install coreML tools by Apple 

`pip install -U coremltools`

Hint: -U means latest version

**4)** Create "convert-script.py" in the directory the model placed. It should be looking something like that

``` Python
import coremltools

caffe_model = ('oxford102.caffemodel', 'deploy.prototxt')

labels = 'flower-labels.txt'

coreml_model = coremltools.converters.caffe.convert(caffe_model, class_labels=labels, image_input_names='data')

coreml_model.save('FlowerClassifier.mlmodel')

```

**5)** Run the script

`pip install -U coremltools`

The Converted model file should be in the directory

---

### Links

- [coremltools documentation](https://apple.github.io/coremltools/)
- [coremltools 4.1](https://pypi.org/project/coremltools/)
- [Installation](https://coremltools.readme.io/docs/installation)
- [Quickstart Example](https://coremltools.readme.io/docs/introductory-quickstart)

### Troubleshooting

- [How to switch Python versions in Terminal?](https://stackoverflow.com/questions/43354382/how-to-switch-python-versions-in-terminal/43354441)