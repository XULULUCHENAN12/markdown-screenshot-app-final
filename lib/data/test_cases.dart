class TestCases {
  static const Map<String, TestCase> cases = {
    'long_code_lines': TestCase(
      title: '超长代码行测试',
      markdown: '''# 超长代码行测试

## JavaScript长函数名和链式调用
```javascript
function thisIsAnExtremelyLongFunctionNameThatShouldTestTheWordWrappingBehaviorInCodeBlocks() {
  const anotherVeryLongVariableNameToTestWrapping = someObject.methodCall().chainedMethod().anotherLongChainedMethodCall().finalMethod();
  return "这是一个包含中文字符的字符串，用于测试混合字符的换行效果";
}
```

## Python长表达式
```python
very_long_variable_name_that_exceeds_normal_line_length = some_function_call_with_many_parameters(parameter_one, parameter_two, parameter_three, parameter_four, parameter_five, parameter_six)
another_complex_expression = (condition_one and condition_two and condition_three and condition_four) or (alternative_condition_one and alternative_condition_two)
```''',
      description: '测试超长代码行的自动换行效果',
    ),
    
    'mixed_content': TestCase(
      title: '混合内容测试',
      markdown: '''# 混合内容复杂测试

## 代码块和文本混合
这是一段普通文本，后面跟着代码块：

```javascript
// 这是一个复杂的JavaScript函数，包含长变量名和嵌套逻辑
function processUserDataWithValidationAndErrorHandling(userData, options, callbacks) {
  if (!userData || typeof userData !== 'object') {
    throw new Error('Invalid user data provided');
  }
  
  const validatedData = validateUserInput(userData.email, userData.name, userData.preferences);
  const processedResult = transformUserData(validatedData, options.transformRules);
  
  return {
    success: true,
    data: processedResult,
    metadata: { processedAt: new Date().toISOString(), version: '2.1.0' }
  };
}
```

然后是一个表格：

| 功能特性 | 实现状态 | 测试场景 | 预期效果 |
|---------|---------|---------|---------|
| 代码块自动换行 | 已实现 | 超长JavaScript函数 | 无水平滚动条 |
| VS Code主题 | 已实现 | 深色背景浅色文字 | 符合VS Code Dark+风格 |
| 混合语言支持 | 部分支持 | 中英文混合长字符串 | 正确断词换行 |

## 列表中的代码
1. 第一项包含行内代码：`const longVariableName = 'this is a long string value';`
2. 第二项包含代码块：
   ```sql
   SELECT users.id, users.username, profiles.first_name, profiles.last_name 
   FROM users 
   INNER JOIN profiles ON users.id = profiles.user_id 
   WHERE users.created_at > '2023-01-01' AND users.status = 'active';
   ```
3. 第三项是普通文本''',
      description: '测试代码块与其他Markdown元素的混合显示',
    ),
    
    'simple_code': TestCase(
      title: '简单代码测试',
      markdown: '''# 简单代码测试

## 基本代码块
```javascript
function simpleFunction() {
  const message = "Hello World";
  console.log(message);
  return message;
}
```

## Python代码
```python
def simple_function():
    message = "Hello World"
    print(message)
    return message
```

## 行内代码
这里有一些行内代码：`console.log("Hello")` 和 `print("Hello")`。''',
      description: '测试基本代码块功能',
    ),
    
    'thinking_example': TestCase(
      title: '思考过程示例',
      thinking: '''让我分析一下这个Markdown截图功能的实现需求：

1. 首先，我需要确保代码块能够正确处理长行，避免出现水平滚动条的问题
2. 油猴脚本中使用的关键CSS属性包括：
   - white-space: pre-wrap（保持空格和换行，但允许自动换行）
   - word-break: break-all（在任意字符间断行）
   - overflow-x: hidden（隐藏水平滚动条）
   - 固定的容器宽度（800px）

3. VS Code Dark+主题的特征：
   - 背景色：#1E1E1E
   - 默认文字色：#D4D4D4
   - 保持语法高亮的可读性

基于这些分析，我认为当前的实现方案是可行的。''',
      markdown: '''# Flutter APK实现分析

## 核心技术栈
- **Flutter**: 跨平台移动开发框架
- **WebView**: 用于渲染HTML内容
- **Screenshot**: 屏幕截图功能库
- **flutter_markdown**: 主要Markdown渲染器

## 关键实现特性

### 1. CSS样式优化
```css
pre {
  background-color: #1E1E1E !important;
  white-space: pre-wrap !important;
  word-break: break-all !important;
  overflow-x: hidden !important;
  max-width: 100% !important;
}

pre code {
  color: #D4D4D4 !important;
  font-family: 'Fira Code', 'Source Code Pro', monospace !important;
}
```

### 2. 截图验证机制
```dart
// 验证截图质量的关键指标
class ValidationResult {
  bool isValid = true;
  List<String> issues = [];
  double? actualWidth;
  double? actualHeight;
  double aspectRatio = 0.0;
}
```

## 预期效果
- 代码块正确自动换行
- 无水平滚动条
- VS Code Dark+主题
- 支持思考过程显示
- 智能错误恢复''',
      description: '包含思考过程的技术分析示例',
    ),
  };

  static List<String> get allTitles => cases.keys.toList();
  
  static TestCase? getCase(String key) => cases[key];
}

class TestCase {
  final String title;
  final String markdown;
  final String description;
  final String? thinking;
  
  const TestCase({
    required this.title,
    required this.markdown,
    required this.description,
    this.thinking,
  });
}