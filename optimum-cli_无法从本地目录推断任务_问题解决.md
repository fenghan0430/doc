# optimum-cli: 无法从本地目录推断任务 问题解决

## 问题现象😅

```
optimum-cli export openvino -m Qwen1.5-0.5B-Chat/ ov_model

RuntimeError: Cannot infer the task from a local directory yet, please specify the task manually (feature-extraction, sentence-similarity, token-classification, text-to-audio, question-answering, text-generation, semantic-segmentation, conversational, multiple-choice, automatic-speech-recognition, image-to-image, fill-mask, text-classification, depth-estimation, image-classification, mask-generation, image-to-text, audio-frame-classification, object-detection, zero-shot-image-classification, masked-im, image-segmentation, stable-diffusion-xl, audio-xvector, text2text-generation, stable-diffusion, audio-classification, zero-shot-object-detection).
```

## 解析和解决🥰

**问题解析：**

在使用optimum-cli工具对**本地的模型**进行转换的时候，工具表示无法识别本地模型的类型。

**解决方法：**

使用参数`--task`指定你是什么模型，例如Qwen1.5-0.5B-Chat，这是个语言模型，那就选择`text-generation`。

命令行示例：

```
optimum-cli export openvino -m Qwen1.5-0.5B-Chat/ --task text-generation ov_model
```

其他类型看这里：

| 英文术语 | 中文翻译 |
| --- | --- |
| feature-extraction | 特征提取 |
| sentence-similarity | 句子相似度 |
| token-classification | 标记分类 |
| text-to-audio | 文本转音频 |
| question-answering | 问答 |
| text-generation | 文本生成 |
| semantic-segmentation | 语义分割 |
| conversational | 对话 |
| multiple-choice | 多选 |
| automatic-speech-recognition | 自动语音识别 |
| image-to-image | 图像到图像 |
| fill-mask | 填充掩码 |
| text-classification | 文本分类 |
| depth-estimation | 深度估计 |
| image-classification | 图像分类 |
| mask-generation | 掩码生成 |
| image-to-text | 图像到文本 |
| audio-frame-classification | 音频帧分类 |
| object-detection | 目标检测 |
| zero-shot-image-classification | 零样本图像分类 |
| masked-im | 掩码图像模型 |
| image-segmentation | 图像分割 |
| stable-diffusion-xl | SDXL(AI绘画) |
| audio-xvector | 音频x向量 |
| text2text-generation | 文本到文本生成 |
| stable-diffusion | SD(AI绘画) |
| audio-classification | 音频分类 |
| zero-shot-object-detection | 零样本目标检测 |

## 参考链接

[optimum Github社区](https://github.com/huggingface/optimum/issues/1556)
