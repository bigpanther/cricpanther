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
