import SwiftUI

// MARK: - View para listar reuniões (mock inicial)
struct MeetingsListView: View {
    // Mock data para desenvolvimento
    let mockMeetings = [
        Meeting(title: "Daily Standup", date: Date().addingTimeInterval(3600), duration: 30),
        Meeting(title: "Sprint Planning", date: Date().addingTimeInterval(7200), duration: 60),
        Meeting(title: "Code Review", date: Date().addingTimeInterval(10800), duration: 45)
    ]
    
    var body: some View {
        List(mockMeetings) { meeting in
            VStack(alignment: .leading, spacing: 4) {
                Text(meeting.title)
                    .font(.headline)
                
                Text(meeting.formattedDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Duração: \(meeting.duration) min")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Reuniões")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Model de dados para reunião
struct Meeting: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let duration: Int // em minutos
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct MeetingsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MeetingsListView()
        }
    }
}
