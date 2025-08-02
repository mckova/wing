class AnalysisService {
  Future<String> analyzeText(String text) async {
    // TODO: integrate OpenAI or local LLM
    await Future.delayed(const Duration(milliseconds: 500));
    return 'Analysis result for: \$text';
  }
}
