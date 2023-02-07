namespace musikcube {
    namespace projectm {
        extern void runWindowProc();
        extern void stopWindowProc();
        extern void writePcmData(float* samples, int totalSamples, int channels);
    }
}