---
name: markitdown
description: 当用户提供或引用 PDF、DOCX、PPTX、XLSX 等二进制/办公文档文件时，使用 markitdown_convert_to_markdown 工具将文件转换为 Markdown 格式，以便完整阅读和分析文档内容。转换后基于 Markdown 内容响应用户问题，忽略原文件中的图片（可使用其他模型辅助理解）。
---

# Markitdown MCP 文件读取

## 触发条件

当用户消息中**包含以下任何情形**时，立即加载本 skill：

- 用户提供、引用或提及了 **PDF 文件**（`.pdf`）
- 用户提供、引用或提及了 **Word 文档**（`.docx`）
- 用户提供、引用或提及了 **PPT 演示文稿**（`.pptx`）
- 用户提供、引用或提及了 **Excel 表格**（`.xlsx`）
- 用户要求读取任何**二进制文件**或**办公文档**
- `read` 工具返回 "this model does not support pdf input" 或类似错误

## 核心指令

**遇到二进制文件时，不要直接使用 `read` 工具读取。** 按照以下步骤操作：

1. 使用 `markitdown_convert_to_markdown` 工具将文件转换为 Markdown
2. 参数 `uri` 使用 `file://` 协议的**绝对路径**，例如：
   - `file:///home/user/document.pdf`
   - `file:///mnt/d/project/report.docx`
3. 转换成功后，基于返回的 Markdown 内容理解文档并回答用户问题
4. 文档中的图片无法直接提取文字，若图片内容关键，可告知用户并建议人工查看

## 工具签名

```
markitdown_convert_to_markdown(uri: string)
```

- `uri`: 支持 `file:`、`http:`、`https:`、`data:` 协议的资源地址

## 支持的文件格式

| 格式 | 扩展名 |
|------|--------|
| PDF | `.pdf` |
| Word | `.docx` |
| PowerPoint | `.pptx` |
| Excel | `.xlsx` |
| 图片（含文字） | `.jpg`, `.png`, `.jpeg` |
| HTML | `.html`, `.htm` |
| CSV | `.csv` |
| JSON | `.json` |
| XML | `.xml` |
| ZIP（内文档） | `.zip` |
| 纯文本 | `.txt`, `.md` |

## 注意事项

- 转换后的 Markdown 可能丢失原文档的复杂排版和图片内的文字
- 如果文档中的流程图、架构图等图片内容对回答问题至关重要，可建议用户使用支持图片理解的模型（如 opencode-go/kimi2.6）辅助分析
- 绝对路径务必使用 `file:///` 开头（三个斜杠）
