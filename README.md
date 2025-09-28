# falaAI MVP

## Descrição
Aplicativo iOS para gravação e transcrição automática de reuniões com geração de atas.

## Funcionalidades Core (MVP)
- ✅ Estrutura base SwiftUI + MVVM
- 🔄 Integração com calendário (EventKit)
- 🔄 Gravação de áudio (AVFoundation)
- 🔄 Transcrição de áudio (Whisper API/Core ML)
- 🔄 Geração de atas (ChatGPT API)
- 🔄 Exportação PDF + compartilhamento

## Arquitetura
- **Swift 5.9+**
- **SwiftUI** para interface
- **MVVM** para arquitetura
- **EventKit** para calendário
- **AVFoundation** para áudio
- **Core ML** para transcrição local

## Estrutura do Projeto
```
falaAI/
├── falaAIApp.swift           # App principal
├── ContentView.swift          # Tela inicial
├── MeetingsListView.swift     # Lista de reuniões
├── RecordingView.swift        # Interface de gravação
└── README.md                  # Este arquivo
```

## Como Testar
1. Abra o projeto no Xcode
2. Selecione um simulador iOS 17+
3. Execute (Cmd + R)
4. Navegue pelas telas mockadas

## Próximas Etapas
1. ✅ Projeto base SwiftUI
2. 🔄 Integração com calendário
3. 🔄 Implementar gravação real
4. 🔄 Sistema de transcrição
5. 🔄 Geração de atas
