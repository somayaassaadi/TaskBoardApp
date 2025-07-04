# TaskBoardApp
# Rapport Technique – Application TaskBoardApp (.NET MAUI)

## 1. Choix techniques

### a. Framework et architecture
- **.NET MAUI (.NET 8, C# 12)** : Permet le développement multiplateforme natif (Android, iOS, Windows) avec un seul codebase.
- **MVVM** : Utilisation du pattern Model-View-ViewModel pour séparer la logique métier de l’interface utilisateur.
- **CommunityToolkit.Mvvm** : Simplifie l’implémentation du MVVM avec des attributs comme `[ObservableProperty]` et `[RelayCommand]`.

### b. Persistance et services
- **SQLite via Entity Framework Core** : Stockage local des tâches avec la classe `TaskDbContext` et le service `OfflineTaskService`.
- **Services personnalisés** :
  - `INotificationService` : Affichage de notifications locales à l’utilisateur.
  - `IConnectivityService` : Surveillance de la connectivité réseau et gestion des événements de changement d’état.
- **Gestion de la plateforme** : Utilisation de `DeviceInfo.Platform` pour adapter certains messages ou comportements selon la plateforme.

### c. Navigation et UI
- **Shell** : Navigation déclarative entre les pages (ex : `GoToAsync("///StatsPage")`).
- **ObservableCollection** : Mise à jour automatique de la liste des tâches dans l’UI.
- **Commandes asynchrones** : Utilisation de méthodes async pour la gestion des tâches et la navigation.

---

## 2. Difficultés rencontrées

### a. Synchronisation hors-ligne/en ligne
- **Problème** : Assurer que les tâches créées hors-ligne soient bien synchronisées lors du retour de la connexion.
- **Solution** : Implémentation d’une méthode `LoadOfflineTasks` appelée lors du changement de connectivité, qui synchronise et nettoie les tâches locales.

### b. Gestion de la connectivité
- **Problème** : Détecter de façon fiable les changements de réseau sur toutes les plateformes.
- **Solution** : Utilisation d’un service d’abstraction (`IConnectivityService`) et abonnement à l’événement `ConnectivityChanged`.

### c. Compatibilité multiplateforme
- **Problème** : Certaines APIs ou comportements diffèrent entre Android et iOS (ex : notifications, accès aux fichiers).
- **Solution** : Utilisation de services d’abstraction et adaptation du code selon la plateforme détectée.

### d. Gestion de la base de données
- **Problème** : Les chemins d’accès aux fichiers SQLite diffèrent selon la plateforme, ce qui peut causer des erreurs de lecture/écriture.
- **Solution** : Configuration dynamique du chemin de la base de données dans `TaskDbContext`.

### e. UI et expérience utilisateur
- **Problème** : Ajuster l’interface pour qu’elle soit cohérente et agréable sur Android et iOS (tailles, marges, comportements natifs).
- **Solution** : Tests sur chaque plateforme et adaptation des styles ou messages via la détection de plateforme.

---

## 3. Différences Android/iOS constatées

### a. Notifications
- **Android** : Les notifications locales sont généralement plus flexibles, mais nécessitent parfois des autorisations spécifiques.
- **iOS** : Les notifications sont soumises à des restrictions plus strictes (autorisation utilisateur obligatoire, affichage différent).

### b. Cycle de vie et multitâche
- **Android** : L’application peut être tuée ou mise en veille de façon plus agressive, ce qui peut interrompre des opérations en cours.
- **iOS** : Le système gère différemment la suspension et la reprise, ce qui peut impacter la sauvegarde automatique ou la synchronisation.

### c. Accès aux fichiers et base de données
- **Android** : Le chemin d’accès à la base SQLite est généralement dans un dossier spécifique à l’application.
- **iOS** : Le chemin doit être récupéré via l’API appropriée (ex : `Environment.GetFolderPath` avec `SpecialFolder.LocalApplicationData`).

### d. Navigation et UI
- **Android** : Les transitions de navigation et le comportement du bouton retour sont natifs à la plateforme.
- **iOS** : Les animations et la gestion du retour diffèrent, ce qui peut nécessiter des ajustements pour une expérience fluide.

---

*Document généré le 04/07/2025*
