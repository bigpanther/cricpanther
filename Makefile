.PHONY: run
run:
	flutter run
.PHONY: clean
clean:
	flutter clean
.PHONY: lint
lint:
	flutter analyze
.PHONY: test
test:
	flutter test
.PHONY: release-android
release-android:
	flutter build appbundle
.PHONY: release-ios
release-ios:
	flutter build ipa --release
.PHONY: release-web
release-web:
	flutter build web --release
.PHONY: release
release: clean release-android release-ios release-web
.PHONY: extract-arb
extract-arb:
	flutter pub run intl_translation:extract_to_arb --output-dir=i18n/ lib/l10n/cricpanther_localization.dart
	@echo "Don't forget to add @@locale on new locale file is when adding a new locale"
.PHONY: l10n
l10n:
	flutter pub run intl_utils:generate
