export default {
  outputFile: 'context-dump.md',
  ignoredDirs: ['.git'],
  ignoredPatterns: ['**/*.md'],
  languageMap: {
    lua: 'lua',
    json: 'json',
    md: 'md',
    sh: 'bash',
  }
}

export const includeMarkdown = {
  outputFile: 'context-dump.md',
  ignoredDirs: ['.git'],
  languageMap: {
    lua: 'lua',
    json: 'json',
    sh: 'bash',
    md: 'md',
  }
}