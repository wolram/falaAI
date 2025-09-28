import SwiftUI

// MARK: - View de gravação (mock inicial)
struct RecordingView: View {
    @State private var isRecording = false
    @State private var recordingTime: TimeInterval = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack(spacing: 30) {
            // Status da gravação
            VStack(spacing: 16) {
                Image(systemName: isRecording ? "mic.fill" : "mic.slash.fill")
                    .font(.system(size: 80))
                    .foregroundColor(isRecording ? .red : .gray)
                
                Text(isRecording ? "Gravando..." : "Pronto para gravar")
                    .font(.title2)
                    .fontWeight(.medium)
                
                if isRecording {
                    Text(formatTime(recordingTime))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            
            Spacer()
            
            // Controles de gravação
            HStack(spacing: 40) {
                // Botão de parar (só aparece quando gravando)
                if isRecording {
                    Button(action: stopRecording) {
                        Image(systemName: "stop.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                }
                
                // Botão principal de gravação
                Button(action: toggleRecording) {
                    Image(systemName: isRecording ? "pause.fill" : "play.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .background(isRecording ? Color.orange : Color.red)
                        .clipShape(Circle())
                }
            }
            
            Spacer()
            
            // Informações adicionais
            VStack(spacing: 8) {
                Text("Toque para \(isRecording ? "pausar" : "iniciar") a gravação")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("A gravação será salva automaticamente")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .navigationTitle("Gravação")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Funções de controle
    private func toggleRecording() {
        if isRecording {
            pauseRecording()
        } else {
            startRecording()
        }
    }
    
    private func startRecording() {
        isRecording = true
        recordingTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            recordingTime += 1
        }
    }
    
    private func pauseRecording() {
        isRecording = false
        timer?.invalidate()
        timer = nil
    }
    
    private func stopRecording() {
        isRecording = false
        timer?.invalidate()
        timer = nil
        recordingTime = 0
        // TODO: Implementar salvamento da gravação
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecordingView()
        }
    }
}
