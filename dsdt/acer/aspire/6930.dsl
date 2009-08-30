/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20090422
 *
 * Disassembly of 6930, Sun Aug 30 22:47:52 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000913C (37180)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x1C
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "1025"
 *     Compiler Version 0x01000013 (16777235)
 */
DefinitionBlock ("6930.aml", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000001)
{
    Name (SP2O, 0x4E)
    Name (SP1O, 0x164E)
    Name (IO1B, 0x0600)
    Name (IO1L, 0x70)
    Name (IO2B, 0x0680)
    Name (IO2L, 0x20)
    Name (IO3B, 0x0290)
    Name (IO3L, 0x10)
    Name (MCHB, 0xFED10000)
    Name (MCHL, 0x4000)
    Name (EGPB, 0xFED19000)
    Name (EGPL, 0x1000)
    Name (DMIB, 0xFED18000)
    Name (DMIL, 0x1000)
    Name (IFPB, 0xFED14000)
    Name (IFPL, 0x1000)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (TTTB, 0xFED20000)
    Name (TTTL, 0x00020000)
    Name (SMBS, 0xEFA0)
    Name (PBLK, 0x0410)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (LVL2, 0x0414)
    Name (LVL3, 0x0415)
    Name (LVL4, 0x0416)
    Name (SMIP, 0xB2)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x40)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (PM30, 0x0430)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, One)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (TRTP, One)
    Name (TRTD, 0x02)
    Name (TRTI, 0x03)
    Name (GCDD, One)
    Name (DSTA, 0x0A)
    Name (DSLO, 0x0C)
    Name (DSLC, 0x0E)
    Name (PITS, 0x10)
    Name (SBCS, 0x12)
    Name (SALS, 0x13)
    Name (LSSS, 0x2A)
    Name (PSSS, 0x2B)
    Name (SOOT, 0x35)
    Name (ESCS, 0x48)
    Name (PDBR, 0x4D)
    Name (SMBL, 0x10)
    OperationRegion (GPIO, SystemIO, 0x0538, 0x03)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
            ,   1, 
        CPEN,   1
    }

    OperationRegion (PMBA, SystemIO, 0x0400, 0x80)
    Field (PMBA, ByteAcc, NoLock, Preserve)
    {
                Offset (0x10), 
            ,   1, 
        THDY,   3, 
        THEN,   1, 
                Offset (0x28), 
            ,   2, 
        SPST,   1, 
                Offset (0x42), 
            ,   1, 
        GPEC,   1, 
                Offset (0x64), 
            ,   9, 
        SCIS,   1, 
                Offset (0x66)
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x1000), 
                Offset (0x3000), 
                Offset (0x3404), 
        HPAS,   2, 
            ,   5, 
        HPAE,   1, 
                Offset (0x3418), 
            ,   1, 
        PATD,   1, 
        SATD,   1, 
        SMBD,   1, 
        HDAD,   1, 
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1, 
        RP5D,   1, 
        RP6D,   1
    }

    OperationRegion (MBOX, SystemMemory, 0xBFDBEC18, 0x000002BC)
    Field (MBOX, AnyAcc, NoLock, Preserve)
    {
        PCI1,   8, 
        PCI2,   8, 
        PCI3,   8, 
        PCI4,   8, 
        PCI5,   8, 
        PCI6,   8, 
        PCI7,   8, 
        PCI8,   8, 
        NLCK,   8, 
        ZIPE,   8, 
        COMA,   8, 
        CAIO,   8, 
        CAIP,   8, 
        CAMD,   8, 
        CADA,   8, 
        COMB,   8, 
        CBIO,   8, 
        CBIP,   8, 
        CBMD,   8, 
        CBDA,   8, 
        FHSD,   8, 
        COMC,   8, 
        CCIO,   8, 
        CCIP,   8, 
        CCMD,   8, 
        CCDA,   8, 
        COMD,   8, 
        CDIO,   8, 
        CDIP,   8, 
        CDMD,   8, 
        CDDA,   8, 
        LPT1,   8, 
        L1IO,   8, 
        L1IP,   8, 
        L1MD,   8, 
        L1DA,   8, 
        LPT2,   8, 
        L2IO,   8, 
        L2IP,   8, 
        L2MD,   8, 
        L2DA,   8, 
        LPT3,   8, 
        L3IO,   8, 
        L3IP,   8, 
        L3MD,   8, 
        L3DA,   8, 
        FDDC,   8, 
        FDWP,   8, 
        HGMP,   8, 
        LGMP,   8, 
        MIDI,   8, 
        AZLA,   8, 
        AUDO,   8, 
        MODM,   8, 
        IDEC,   8, 
        SSED,   8, 
        PACT,   8, 
        SCFG,   8, 
        AMOD,   8, 
        IMOD,   8, 
        LCFG,   8, 
        IDLY,   8, 
        PMTP,   8, 
        PMIO,   8, 
        PMBM,   8, 
        PMTM,   8, 
        PSTP,   8, 
        PSIO,   8, 
        PSBM,   8, 
        PSTM,   8, 
        IDE0,   8, 
        IDE1,   8, 
        IDE2,   8, 
        IDE3,   8, 
        IDE4,   8, 
        IDE5,   8, 
        IDE6,   8, 
        IDE7,   8, 
        HIUB,   8, 
        LUBS,   8, 
        PLYT,   8, 
        EDCG,   8, 
        SDFY,   8, 
        SDTC,   8, 
        SDRP,   8, 
        SDCL,   8, 
        SDRC,   8, 
        SDRE,   8, 
        FC2L,   8, 
        FC3L,   8, 
        FCS4,   8, 
        APIM,   8, 
        HPTS,   8, 
        HPTA,   8, 
        EMAS,   8, 
        VGAO,   8, 
        SOFF,   8, 
        KBPO,   8, 
        MSPO,   8, 
        USBB,   8, 
        EVTL,   8, 
        SYBE,   8, 
        ETLC,   8, 
        AC30,   8, 
        TPMD,   8, 
        TPMO,   8, 
        TPMC,   8, 
        TPMM,   8, 
        TPCC,   8, 
        TPLC,   8, 
        TPLR,   32, 
        QBOT,   8, 
        BOTQ,   8, 
        PBOT,   8, 
        M256,   8, 
        PEGF,   8, 
        OSYS,   16, 
        BMTP,   8, 
        BNPT,   8, 
        LNMT,   8, 
        NBTO,   8, 
        NABD,   8, 
        NEBD,   8, 
        NLBD,   8, 
        DFBT,   16, 
        NPSP,   16, 
        LANG,   8, 
        UACL,   8, 
        SUPS,   8, 
        DVET,   8, 
        S3RS,   8, 
        DAS1,   8, 
        DAS3,   8, 
        WKPM,   8, 
        WKMD,   8, 
        WKS5,   8, 
        HOUR,   8, 
        MINS,   8, 
        SECS,   8, 
        DOFM,   8, 
        NBTV,   128, 
        BTOD,   128, 
        SPVP,   16, 
        POPW,   16, 
        USPW,   16, 
        HDPW,   16, 
        KRSV,   352, 
        LANE,   8, 
        AORS,   8, 
        P0HP,   8, 
        P1HP,   8, 
        P4HP,   8, 
        P5HP,   8, 
        P0IL,   8, 
        P1IL,   8, 
        P2IL,   8, 
        PEGS,   8, 
        D2F1,   8, 
        IGMT,   8, 
        DTSZ,   8, 
        CLKC,   8, 
        CKSC,   8, 
        BOTT,   8, 
        PANT,   8, 
        TVTP,   8, 
        U201,   8, 
        U202,   8, 
        U111,   8, 
        U112,   8, 
        U113,   8, 
        U114,   8, 
        U115,   8, 
        UPPC,   8, 
        UP00,   8, 
        UP01,   8, 
        UP02,   8, 
        UP03,   8, 
        UP04,   8, 
        UP05,   8, 
        UP06,   8, 
        UP07,   8, 
        UP08,   8, 
        UP09,   8, 
        UP10,   8, 
        UP11,   8, 
        P80R,   8, 
        WDOG,   8, 
        WDTO,   16, 
        WDTB,   16, 
        MASF,   8, 
        MAMT,   8, 
        ABXP,   8, 
        SPIL,   8, 
        PWDW,   8, 
        HETO,   8, 
        AWTR,   16, 
        EOPT,   8, 
        ASFB,   8, 
        MBTX,   8, 
        IDER,   8, 
        SOLE,   8, 
        PRE0,   8, 
        PRE1,   8, 
        PRE2,   8, 
        PRE3,   8, 
        PRE4,   8, 
        PRE5,   8, 
        PRA0,   8, 
        PRA1,   8, 
        PRA2,   8, 
        PRA3,   8, 
        PRA4,   8, 
        PRA5,   8, 
        PRV0,   8, 
        PRV1,   8, 
        PRV2,   8, 
        PRV3,   8, 
        PRV4,   8, 
        PRV5,   8, 
        PAA0,   8, 
        PAA1,   8, 
        PAA2,   8, 
        PAA3,   8, 
        PAA4,   8, 
        PAA5,   8, 
        L0S0,   8, 
        L0S1,   8, 
        L0S2,   8, 
        L0S3,   8, 
        L0S4,   8, 
        L0S5,   8, 
        AL10,   8, 
        AL11,   8, 
        AL12,   8, 
        AL13,   8, 
        AL14,   8, 
        AL15,   8, 
        PES0,   8, 
        PES1,   8, 
        PES2,   8, 
        PES3,   8, 
        PES4,   8, 
        PES5,   8, 
        PRU0,   8, 
        PRU1,   8, 
        PRU2,   8, 
        PRU3,   8, 
        PRU4,   8, 
        PRU5,   8, 
        PRF0,   8, 
        PRF1,   8, 
        PRF2,   8, 
        PRF3,   8, 
        PRF4,   8, 
        PRF5,   8, 
        PRN0,   8, 
        PRN1,   8, 
        PRN2,   8, 
        PRN3,   8, 
        PRN4,   8, 
        PRN5,   8, 
        PRC0,   8, 
        PRC1,   8, 
        PRC2,   8, 
        PRC3,   8, 
        PRC4,   8, 
        PRC5,   8, 
        CTD0,   8, 
        CTD1,   8, 
        CTD2,   8, 
        CTD3,   8, 
        CTD4,   8, 
        CTD5,   8, 
        PIE0,   8, 
        PIE1,   8, 
        PIE2,   8, 
        PIE3,   8, 
        PIE4,   8, 
        PIE5,   8, 
        SFE0,   8, 
        SFE1,   8, 
        SFE2,   8, 
        SFE3,   8, 
        SFE4,   8, 
        SFE5,   8, 
        SNE0,   8, 
        SNE1,   8, 
        SNE2,   8, 
        SNE3,   8, 
        SNE4,   8, 
        SNE5,   8, 
        SCE0,   8, 
        SCE1,   8, 
        SCE2,   8, 
        SCE3,   8, 
        SCE4,   8, 
        SCE5,   8, 
        MCE0,   8, 
        MCE1,   8, 
        MCE2,   8, 
        MCE3,   8, 
        MCE4,   8, 
        MCE5,   8, 
        PCE0,   8, 
        PCE1,   8, 
        PCE2,   8, 
        PCE3,   8, 
        PCE4,   8, 
        PCE5,   8, 
        PTC0,   8, 
        PTC1,   8, 
        PTC2,   8, 
        PTC3,   8, 
        PTC4,   8, 
        PTC5,   8, 
        DAPM,   8, 
        DPMA,   8, 
        DL0S,   8, 
        DAL1,   8, 
        PEGA,   8, 
        PGAA,   8, 
        PGL0,   8, 
        PL0A,   8, 
        PGL1,   8, 
        PGES,   8, 
        PAVP,   8, 
        ISTC,   8, 
        TRML,   8, 
        FNON,   8, 
        TRON,   8, 
        NXMD,   8, 
        PCRR,   8, 
        C4EN,   8, 
        C43D,   8, 
        EMTT,   8, 
        PROH,   8, 
        DFSB,   8, 
        TUBM,   8, 
        TSTE,   8, 
        BPST,   8, 
        QKS4,   8, 
        POPU,   8, 
        POPD,   8, 
        C4ET,   8, 
        NXFE,   8, 
        VTST,   8, 
        VTFE,   8, 
        S5FG,   8, 
        CSTS,   8, 
        ENCS,   8, 
        DEC4,   8, 
        HC4E,   8, 
        ENC6,   8, 
        CSTR,   8, 
        CMPE,   8, 
        CSMD,   8, 
        DTSE,   8, 
        DTSC,   8, 
        RAID,   8, 
        PSHM,   8, 
        PEXC,   8, 
        DTST,   8, 
        TXTS,   8, 
        VTDE,   8, 
        SMRR,   8, 
        CART,   8, 
        CATT,   8, 
        ITPM,   8, 
        STBE,   8, 
        PEBE,   8, 
        PCBE,   8, 
        EHBE,   8, 
        UHBE,   8, 
        HABE,   8, 
        MTME,   8, 
        MTSD,   8, 
        MTML,   8, 
        ERS2,   8, 
        GLPM,   8, 
        CRSV,   520, 
        WMDT,   16, 
        WPWT,   16, 
        PSW0,   8, 
        PSW1,   8, 
        D2DF,   8, 
        F12F,   8, 
        ORSV,   496, 
        IOHN,   8, 
        DRSV,   792
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x02), 
                Offset (0x04), 
                Offset (0x06), 
                Offset (0x08), 
        TRP0,   8, 
                Offset (0x0A), 
                Offset (0x0B), 
                Offset (0x0C), 
                Offset (0x0D), 
                Offset (0x0E), 
                Offset (0x0F), 
                Offset (0x10)
    }

    OperationRegion (IO_D, SystemIO, 0x0810, 0x08)
    Field (IO_D, ByteAcc, NoLock, Preserve)
    {
        TRPD,   8
    }

    OperationRegion (IO_H, SystemIO, 0x0820, 0x04)
    Field (IO_H, ByteAcc, NoLock, Preserve)
    {
        TRPH,   8
    }

    OperationRegion (NVST, SystemMemory, 0xBFDBEED4, 0x000000DC)
    Field (NVST, AnyAcc, Lock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        CRTT,   8, 
                Offset (0x15), 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        BNUM,   8, 
        APIC,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        BDSP,   8, 
        PTY1,   8, 
        PTY2,   8, 
        PSCL,   8, 
        TVF1,   8, 
        TVF2,   8, 
        GETM,   8, 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
        MEFE,   8, 
        DSTS,   8, 
        TPMP,   8, 
        TPME,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IPC,    8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        LCDA,   16, 
        BVAL,   32, 
        KSV0,   32, 
        KSV1,   8, 
        DI00,   320
    }

    OperationRegion (ECMB, SystemIO, 0x0600, 0x02)
    Field (ECMB, ByteAcc, NoLock, Preserve)
    {
        MIDX,   8, 
        MDAT,   8
    }

    IndexField (MIDX, MDAT, ByteAcc, NoLock, Preserve)
    {
        CRTP,   8, 
        CLTP,   8, 
        VRTP,   8, 
        VLTP,   8, 
        BPER,   8, 
                Offset (0x06), 
        ECFG,   1, 
        WINF,   1, 
        DOSF,   1, 
        SKU0,   1, 
        CKFG,   1, 
        CRFG,   1, 
        F10G,   1, 
        IOFG,   1, 
        SROM,   8, 
        VSTA,   1, 
        WAOL,   1, 
            ,   1, 
        TPAD,   1, 
        CRTS,   1, 
        LAIO,   1, 
        BT0S,   1, 
                Offset (0x09), 
        BRIG,   4, 
        BIDF,   1, 
        BKTS,   1, 
        G3XT,   1, 
        G3TS,   1, 
        WEXT,   1, 
        WSTS,   1, 
        BEXT,   1, 
        BSTS,   1, 
        WPRS,   1, 
        BTRS,   1, 
        G3RS,   1, 
        BPRS,   1, 
            ,   6, 
        LNMG,   1, 
                Offset (0x0C), 
                Offset (0x0D), 
                Offset (0x0E), 
                Offset (0x0F), 
        MBID,   2, 
        SKID,   3, 
        PAID,   3, 
                Offset (0x11), 
        ECMC,   8, 
        IND0,   8, 
        IND1,   8, 
        DAT0,   8, 
        DAT1,   8, 
        TBX0,   1, 
        CDS1,   1, 
        CDS2,   1, 
        CDS3,   1, 
            ,   2, 
        TBX6,   1, 
        TBX7,   1, 
                Offset (0x18), 
                Offset (0x19), 
                Offset (0x1A), 
                Offset (0x1B), 
                Offset (0x1C), 
        LDST,   1, 
        CRST,   1, 
        FNST,   1, 
        ACST,   1, 
        BL1,    1, 
        BL2,    1, 
        PWOR,   1, 
        BCLW,   1, 
        BT0P,   1, 
            ,   1, 
            ,   2, 
        BCG0,   1, 
            ,   1, 
                Offset (0x1E), 
        BDC0,   1, 
            ,   1, 
            ,   2, 
        BFC0,   1, 
            ,   1, 
                Offset (0x1F), 
        B0L1,   1, 
            ,   1, 
            ,   2, 
        B0L2,   1, 
            ,   1, 
                Offset (0x20), 
        B0PL,   8, 
        B0RL,   8, 
        B0RH,   8, 
        LF0L,   8, 
        LF0H,   8, 
        SN0L,   8, 
        SN0H,   8, 
        CR0L,   8, 
        CR0H,   8, 
        DVL0,   8, 
        DVH0,   8, 
        VLB0,   8, 
        VHB0,   8
    }

    Name (ACPS, Zero)
    Name (RTMP, One)
    Name (TMPI, Zero)
    Method (RDEC, 1, NotSerialized)
    {
        Sleep (0x0A)
        Store (IND0, TMPI)
        Store (Arg0, IND0)
        Store (0x90, ECMC)
        Sleep (0x0A)
        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        Store (DAT0, Local0)
        Store (TMPI, IND0)
        Return (Local0)
    }

    Method (WREC, 2, NotSerialized)
    {
        Sleep (0x0A)
        Store (IND0, TMPI)
        Store (Arg0, IND0)
        Store (Arg1, DAT0)
        Store (0x91, ECMC)
        Sleep (0x0A)
        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        Store (TMPI, IND0)
    }

    Method (ECW1, 2, NotSerialized)
    {
        Store (Arg0, DAT0)
        Store (Arg1, ECMC)
        Sleep (0x0A)
        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }

        If (ECMC)
        {
            Sleep (0x0A)
        }
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
        Processor (CPU2, 0x03, 0x00000410, 0x06) {}
        Processor (CPU3, 0x04, 0x00000410, 0x06) {}
    }

    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, Zero))
        {
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D)
        }

        If (LEqual (Arg0, One))
        {
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D)
        }

        Store (P80D, P80H)
    }

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8, 
        SSMD,   8
    }

    Method (ISMI, 1, NotSerialized)
    {
        Store (Arg0, SSMD)
        Store (0xB2, SSMP)
        Sleep (0x10)
    }

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF)
        If (LEqual (Arg0, TRTP))
        {
            Store (Zero, TRP0)
        }

        If (LEqual (Arg0, TRTD))
        {
            Store (Arg1, DTSF)
            Store (Zero, TRPD)
            Return (DTSF)
        }

        If (LEqual (Arg0, TRTI))
        {
            Store (Zero, TRPH)
        }

        Return (SMIF)
    }

    OperationRegion (CMS1, SystemIO, 0x72, 0x02)
    Field (CMS1, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }

    Method (CMSW, 2, NotSerialized)
    {
        Store (Arg0, CMSI)
        Store (Arg1, CMSD)
    }

    Mutex (PSMX, 0x00)
    Method (IHWM, 2, NotSerialized)
    {
        Acquire (PSMX, 0xFFFF)
        Store (Arg0, PRM0)
        Store (Arg1, DI00)
        Store (0xD1, APMC)
        Store (DI00, Local0)
        Release (PSMX)
        Return (Local0)
    }

    OperationRegion (SMIO, SystemIO, 0xB2, 0x02)
    Field (SMIO, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    Method (_PTS, 1, NotSerialized)
    {
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (0x0A, MIDX)
            Store (MDAT, Local0)
            And (Local0, 0x0F, Local0)
            Or (Local0, 0x20, Local0)
            CMSW (0x55, Local0)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x3F, CMSI)
            Store (CMSD, Local0)
            And (Local0, 0x80, Local0)
            Or (Local0, 0x54, Local0)
            CMSW (0x3F, Local0)
            Store (\_SB.PCI0.LPC.EC0.PWST, Local0)
            Or (Local0, 0x02, \_SB.PCI0.LPC.EC0.PWST)
            Store (0x10, Local0)
            If (LEqual (TPAD, One))
            {
                Or (Local0, One, Local0)
            }

            CMSW (0x54, Local0)
            Store (0x54, P80H)
        }

        Return (Zero)
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (0x10, P80H)
            Notify (\_SB.ADP0, Zero)
            Store (0x11, P80H)
            Store (0x14, Local0)
            While (LAnd (LEqual (BT0P, Zero), LNotEqual (Local0, Zero)))
            {
                Sleep (0x0A)
                Subtract (Local0, One, Local0)
            }

            Store (0x12, P80H)
            If (LEqual (BT0P, One))
            {
                While (LEqual (B0PL, Zero))
                {
                    Sleep (0x0A)
                }
            }

            Notify (\_SB.BAT0, 0x81)
            Sleep (0x32)
            Notify (\_SB.BAT0, 0x80)
            Sleep (0x32)
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (0x55, CMSI)
            Store (CMSD, Local0)
            Store (0x0A, MIDX)
            Store (And (Local0, 0x0F), MDAT)
            While (ECMC)
            {
                Sleep (0x0A)
            }

            Store (0x08, DAT0)
            Sleep (0x0A)
            Store (0x97, ECMC)
            While (ECMC)
            {
                Sleep (0x0A)
            }

            Store (0x55, CMSI)
            Store (CMSD, Local0)
            If (LEqual (And (Local0, 0x02), 0x02))
            {
                Store (0x05, DAT0)
            }
            Else
            {
                Store (0x06, DAT0)
            }

            Sleep (0x0A)
            Store (0x16, ECMC)
            While (ECMC)
            {
                Sleep (0x0A)
            }

            Store (0x55, CMSI)
            Store (CMSD, Local0)
            If (LEqual (And (Local0, 0x08), 0x08))
            {
                Store (0x07, DAT0)
            }
            Else
            {
                Store (0x08, DAT0)
            }

            Sleep (0x0A)
            Store (0x16, ECMC)
            While (ECMC)
            {
                Sleep (0x0A)
            }

            CMSW (0x55, Zero)
        }

        If (LEqual (RP1D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP1.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP1, Zero)
            }
        }

        If (LEqual (RP2D, Zero))
        {
            Notify (\_SB.PCI0.EXP2, Zero)
        }

        If (LEqual (RP3D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP3.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP3, Zero)
            }
        }

        If (LEqual (RP4D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP4.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP4, Zero)
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, CMPE))
            {
                Store (0x14, DTSF)
                Store (Zero, TRPD)
            }

            If (LEqual (OSYS, 0x07D6))
            {
                Store (One, VSTA)
                Sleep (0x0A)
            }

            Notify (\_SB.PCI0.EXP5, Zero)
            Store (0xE3, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LAnd (DTSE, CMPE))
            {
                Store (0x14, DTSF)
                Store (Zero, TRPD)
            }

            If (LEqual (OSYS, 0x07D6))
            {
                Store (One, VSTA)
                Sleep (0x0A)
            }

            Store (0x54, CMSI)
            Store (CMSD, Local0)
            If (LEqual (And (Local0, 0x10), 0x10))
            {
                While (ECMC) {}
                If (LEqual (And (Local0, One), Zero))
                {
                    Store (0x09, DAT0)
                }
                Else
                {
                    Store (0x0A, DAT0)
                }

                Sleep (0x0A)
                Store (0x16, ECMC)
            }

            CMSW (0x54, Zero)
            Store (0xE4, P80H)
            Store (0x3F, CMSI)
            Store (CMSD, Local0)
            And (Local0, 0x80, Local0)
            CMSW (0x3F, Local0)
        }

        Return (Zero)
    }

    If (LEqual (DAS3, One))
    {
        Name (_S3, Package (0x04)
        {
            0x05, 
            0x05, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)
    {
        0x06, 
        0x06, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)
    {
        0x07, 
        0x07, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, One, L01C)
            P8XH (Zero, One)
            P8XH (One, L01C)
            If (LNotEqual (\_SB.PCI0.EXP1.VDID, 0xFFFF))
            {
                If (LAnd (LEqual (RP1D, Zero), \_SB.PCI0.EXP1.HPSX))
                {
                    Sleep (0x64)
                    If (\_SB.PCI0.EXP1.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP1.PDCX)
                        Store (One, \_SB.PCI0.EXP1.HPSX)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP1.HPSX)
                    }
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP2.VDID, 0xFFFF))
            {
                If (LAnd (LEqual (RP2D, Zero), \_SB.PCI0.EXP2.HPSX))
                {
                    Sleep (0x64)
                    If (\_SB.PCI0.EXP2.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP2.PDCX)
                        Store (One, \_SB.PCI0.EXP2.HPSX)
                        Notify (\_SB.PCI0.EXP2, Zero)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP2.HPSX)
                    }
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP3.VDID, 0xFFFF))
            {
                If (LAnd (LEqual (RP3D, Zero), \_SB.PCI0.EXP3.HPSX))
                {
                    Sleep (0x64)
                    If (\_SB.PCI0.EXP3.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP3.PDCX)
                        Store (One, \_SB.PCI0.EXP3.HPSX)
                        Notify (\_SB.PCI0.EXP3, Zero)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP3.HPSX)
                    }
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP4.VDID, 0xFFFF))
            {
                If (LAnd (LEqual (RP4D, Zero), \_SB.PCI0.EXP4.HPSX))
                {
                    Sleep (0x64)
                    If (\_SB.PCI0.EXP4.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP4.PDCX)
                        Store (One, \_SB.PCI0.EXP4.HPSX)
                        Notify (\_SB.PCI0.EXP4, Zero)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP4.HPSX)
                    }
                }
            }

            P8XH (Zero, 0xE0)
            If (LEqual (RP5D, Zero))
            {
                Sleep (0x64)
                P8XH (Zero, 0xE1)
                If (LEqual (\_SB.PCI0.EXP5.PDCX, One))
                {
                    P8XH (Zero, 0xE2)
                    Store (One, \_SB.PCI0.EXP5.PDCX)
                    Store (One, \_SB.PCI0.EXP5.HPSX)
                    P8XH (Zero, 0xE3)
                    If (Ones)
                    {
                        Store (0x0A, Local2)
                        P8XH (Zero, 0xE4)
                        While (LGreater (Local2, Zero))
                        {
                            Sleep (0x64)
                            P8XH (Zero, 0xE5)
                            And (\_SB.PCI0.EXP5.J382.DVID, 0xFFF0FFFF, Local1)
                            If (LEqual (Local1, 0x2380197B))
                            {
                                P8XH (Zero, 0xE6)
                                Store (And (SKID, 0x04), Local0)
                                If (LEqual (Local0, Zero))
                                {
                                    Store (0xB0, \_SB.PCI0.EXP5.J382.ATRB)
                                    Store (0x01461025, \_SB.PCI0.EXP5.J382.SSID)
                                    Store (0x01461025, \_SB.PCI0.EXP5.J381.SSID)
                                    Store (0x01461025, \_SB.PCI0.EXP5.J383.SSID)
                                    Store (0x01461025, \_SB.PCI0.EXP5.J384.SSID)
                                    Store (0x30, \_SB.PCI0.EXP5.J382.ATRB)
                                }
                                Else
                                {
                                    Store (0xB0, \_SB.PCI0.EXP5.J382.ATRB)
                                    Store (0x01451025, \_SB.PCI0.EXP5.J382.SSID)
                                    Store (0x01451025, \_SB.PCI0.EXP5.J381.SSID)
                                    Store (0x01451025, \_SB.PCI0.EXP5.J383.SSID)
                                    Store (0x01451025, \_SB.PCI0.EXP5.J384.SSID)
                                    Store (0x30, \_SB.PCI0.EXP5.J382.ATRB)
                                }

                                Store (0x47, \_SB.PCI0.EXP5.J382.RGAE)
                                Store (0x80, \_SB.PCI0.EXP5.J382.PMC0)
                                Store (Zero, \_SB.PCI0.EXP5.J382.RGCD)
                                Store (0x88, \_SB.PCI0.EXP5.J382.LAT0)
                                Store (0xA0, \_SB.PCI0.EXP5.J382.RGDE)
                                P8XH (Zero, 0xE7)
                                Store (Zero, Local2)
                            }
                            Else
                            {
                                Decrement (Local2)
                            }

                            P8XH (Zero, 0xE8)
                        }
                    }
                    Else
                    {
                        Sleep (0x64)
                    }

                    P8XH (Zero, 0xE9)
                    Notify (\_SB.PCI0.EXP5, Zero)
                }
                Else
                {
                    P8XH (Zero, 0xEA)
                    Store (One, \_SB.PCI0.EXP5.HPSX)
                }

                P8XH (Zero, 0xEB)
            }

            P8XH (Zero, 0xEC)
        }

        Method (_L06, 0, NotSerialized)
        {
            If (\_SB.PCI0.OVGA.GSSE)
            {
                \_SB.PCI0.OVGA.GSCI ()
            }
            Else
            {
                Store (One, SCIS)
            }
        }

        Method (_L07, 0, NotSerialized)
        {
        }

        Method (_L08, 0, NotSerialized)
        {
        }

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EXP1, 0x02)
            Notify (\_SB.PCI0.EXP1.PXSX, 0x02)
            Notify (\_SB.PCI0.EXP2, 0x02)
            Notify (\_SB.PCI0.EXP3, 0x02)
            Notify (\_SB.PCI0.EXP4, 0x02)
            Notify (\_SB.PCI0.EXP5, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P32, 0x02)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC2, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC3, 0x02)
        }

        Method (_L20, 0, NotSerialized)
        {
        }

        Method (_L0D, 0, NotSerialized)
        {
        }

        Method (_L0E, 0, NotSerialized)
        {
        }

        Method (_L05, 0, NotSerialized)
        {
        }
    }

    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Name (DFEC, Zero)
    Scope (_TZ)
    {
        PowerResource (FN00, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)
            {
                If (LEqual (DTSF, Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (One)
                }
            }

            Method (_ON, 0, Serialized)
            {
            }

            Method (_OFF, 0, Serialized)
            {
            }
        }

        Device (FAN0)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, Zero)
            Name (_PR0, Package (0x01)
            {
                FN00
            })
        }

        ThermalZone (TZ00)
        {
            Method (_AC0, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (ACTT, 0x0A)))
            }

            Name (_AL0, Package (0x01)
            {
                FAN0
            })
            Method (_CRT, 0, Serialized)
            {
                If (DTSE)
                {
                    Return (Add (0x0AAC, Multiply (CRTT, 0x0A)))
                }

                Return (0x0ED0)
            }

            Method (_SCP, 1, Serialized)
            {
                Store (Arg0, CTYP)
            }

            Method (_TMP, 0, Serialized)
            {
                Store (CRTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_PSL, 0, Serialized)
            {
                If (CMPE)
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_TSP, 0, Serialized)
            {
                Return (0x96)
            }
        }

        ThermalZone (TZVR)
        {
            Method (_TMP, 0, Serialized)
            {
                Store (VRTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (0x0ED0)
            }
        }

        ThermalZone (TZVL)
        {
            Method (_TMP, 0, Serialized)
            {
                Store (VLTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (0x0ED0)
            }
        }

        ThermalZone (TZ01)
        {
            Method (_CRT, 0, Serialized)
            {
                Return (0x0ED0)
            }

            Method (_TMP, 0, Serialized)
            {
                Store (CLTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }
        }
    }

    Method (GETP, 1, Serialized)
    {
        If (LEqual (And (Arg0, 0x09), Zero))
        {
            Return (Ones)
        }

        If (LEqual (And (Arg0, 0x09), 0x08))
        {
            Return (0x0384)
        }

        ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
        ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
        Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
            ))
    }

    Method (GDMA, 5, Serialized)
    {
        If (Arg0)
        {
            If (Arg1)
            {
                Return (0x14)
            }

            If (Arg2)
            {
                Return (Multiply (Subtract (0x04, Arg3), 0x0F))
            }

            Return (Multiply (Subtract (0x04, Arg3), 0x1E))
        }

        Return (Ones)
    }

    Method (GETT, 1, Serialized)
    {
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
            ), 0x03), And (Arg0, 0x03)))))
    }

    Method (GETF, 3, Serialized)
    {
        Name (TMPF, Zero)
        If (Arg0)
        {
            Or (TMPF, One, TMPF)
        }

        If (And (Arg2, 0x02))
        {
            Or (TMPF, 0x02, TMPF)
        }

        If (Arg1)
        {
            Or (TMPF, 0x04, TMPF)
        }

        If (And (Arg2, 0x20))
        {
            Or (TMPF, 0x08, TMPF)
        }

        If (And (Arg2, 0x4000))
        {
            Or (TMPF, 0x10, TMPF)
        }

        Return (TMPF)
    }

    Method (SETP, 3, Serialized)
    {
        If (LGreater (Arg0, 0xF0))
        {
            Return (0x08)
        }
        Else
        {
            If (And (Arg1, 0x02))
            {
                If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                {
                    Return (0x2301)
                }

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
                {
                    Return (0x2101)
                }
            }

            Return (0x1001)
        }
    }

    Method (SDMA, 1, Serialized)
    {
        If (LLessEqual (Arg0, 0x14))
        {
            Return (One)
        }

        If (LLessEqual (Arg0, 0x1E))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x2D))
        {
            Return (One)
        }

        If (LLessEqual (Arg0, 0x3C))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x5A))
        {
            Return (One)
        }

        Return (Zero)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
            {
                Return (0x09)
            }
        }

        Return (0x04)
    }

    Scope (_SB)
    {
        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                Store (LDST, Local0)
                If (LEqual (Local0, One))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (One)
                }
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, One)
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (BIF0, Package (0x0D)
            {
                One, 
                0x12C0, 
                Zero, 
                One, 
                0x39D0, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                "Acer", 
                "0000", 
                "Lion", 
                ""
            })
            Name (BST0, Package (0x04)
            {
                One, 
                0x0A90, 
                0x1000, 
                0x2A30
            })
            Method (_STA, 0, NotSerialized)
            {
                If (^^PCI0.LPC.EC0.ECOK)
                {
                    If (BT0S)
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
                Else
                {
                    Return (0x1F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (^^PCI0.LPC.EC0.ECOK)
                {
                    Store (LF0L, Local0)
                    Store (LF0H, Local1)
                    ShiftLeft (Local1, 0x08, Local1)
                    Add (Local0, Local1, Local0)
                    Store (Local0, Index (BIF0, 0x02))
                    Store (DVL0, Local4)
                    Store (DVH0, Local5)
                    ShiftLeft (Local5, 0x08, Local5)
                    Add (Local4, Local5, Local4)
                    Store (Local4, Index (BIF0, 0x04))
                    Store (Zero, Local2)
                    Store (Local2, Index (BIF0, 0x05))
                    Store (Zero, Local4)
                    Store (Local4, Index (BIF0, 0x06))
                    Subtract (Local2, Local4, Local6)
                    Store (Local6, Index (BIF0, 0x07))
                    Subtract (Local0, Local2, Local7)
                    Store (Local7, Index (BIF0, 0x08))
                    Store (SN0L, Local0)
                    Store (SN0H, Local5)
                    ShiftLeft (Local5, 0x08, Local5)
                    Add (Local0, Local5, Local0)
                    Store (ITOS (Local0), Local1)
                    Store (Local1, Index (BIF0, 0x0A))
                    Store (RDEC (0xCD), Local0)
                    Store (RDEC (0xCE), Local1)
                    If (LEqual (Local1, 0x32))
                    {
                        If (LEqual (Local0, 0x33))
                        {
                            Store ("AS07B32", Index (BIF0, 0x09))
                            Store ("SANYO", Index (BIF0, 0x0C))
                        }

                        If (LEqual (Local0, 0x34))
                        {
                            Store ("AS07B42", Index (BIF0, 0x09))
                            Store ("SONY", Index (BIF0, 0x0C))
                        }

                        If (LEqual (Local0, 0x35))
                        {
                            Store ("AS07B52", Index (BIF0, 0x09))
                            Store ("Panasonic", Index (BIF0, 0x0C))
                        }

                        If (LEqual (Local0, 0x37))
                        {
                            Store ("AS07B72", Index (BIF0, 0x09))
                            Store ("SIMPLO", Index (BIF0, 0x0C))
                        }
                    }

                    Store (And (SKID, 0x04), Local2)
                    If (LEqual (Local2, Zero))
                    {
                        If (LEqual (Local1, 0x31))
                        {
                            If (LEqual (Local0, 0x33))
                            {
                                Store ("AS07B31", Index (BIF0, 0x09))
                                Store ("SANYO", Index (BIF0, 0x0C))
                            }

                            If (LEqual (Local0, 0x34))
                            {
                                Store ("AS07B41", Index (BIF0, 0x09))
                                Store ("SONY", Index (BIF0, 0x0C))
                            }

                            If (LEqual (Local0, 0x35))
                            {
                                Store ("AS07B51", Index (BIF0, 0x09))
                                Store ("Panasonic", Index (BIF0, 0x0C))
                            }

                            If (LEqual (Local0, 0x37))
                            {
                                Store ("AS07B71", Index (BIF0, 0x09))
                                Store ("SIMPLO", Index (BIF0, 0x0C))
                            }
                        }
                    }
                }

                Return (BIF0)
            }

            Method (_BST, 0, NotSerialized)
            {
                If (WINF)
                {
                    Store (One, Index (BST0, Zero))
                    Store (0x78, Index (BST0, One))
                    Store (0x0BB8, Index (BST0, 0x02))
                    Store (0x3A98, Index (BST0, 0x03))
                    Return (BST0)
                }
                Else
                {
                    If (^^PCI0.LPC.EC0.ECOK)
                    {
                        Store (BCG0, Local1)
                        Store (And (Local1, One), Local1)
                        ShiftLeft (Local1, One, Local2)
                        Store (BDC0, Local0)
                        Store (And (Local0, One), Local0)
                        Or (Local0, Local2, Local3)
                        Store (CR0H, Local2)
                        Multiply (Local2, 0x0100, Local1)
                        Store (CR0L, Local0)
                        Add (Local1, Local0, Local1)
                        Subtract (0xFFFF, Local1, Local1)
                        Add (One, Local1, Local1)
                        Store (Local1, Index (BST0, One))
                        Store (B0PL, Local0)
                        Store (And (Local0, 0x7F), Local0)
                        If (LLess (Local0, 0x0F))
                        {
                            Or (Local3, 0x04, Local3)
                        }

                        Store (Local3, Index (BST0, Zero))
                        Store (B0RH, Local2)
                        Multiply (Local2, 0x0100, Local1)
                        Store (B0RL, Local0)
                        Add (Local1, Local0, Local1)
                        Store (Local1, Index (BST0, 0x02))
                        Store (VLB0, Local4)
                        Store (VHB0, Local5)
                        ShiftLeft (Local5, 0x08, Local5)
                        Add (Local4, Local5, Local4)
                        Store (Local4, Index (BST0, 0x03))
                    }
                    Else
                    {
                        Store (One, Index (BST0, Zero))
                        Store (0x78, Index (BST0, One))
                        Store (0x0BB8, Index (BST0, 0x02))
                        Store (0x3A98, Index (BST0, 0x03))
                    }

                    Return (BST0)
                }
            }
        }

        Method (ITOS, 1, NotSerialized)
        {
            Store ("", Local0)
            Store (0x04, Local1)
            While (Local1)
            {
                Decrement (Local1)
                And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                Store (DerefOf (Index (CHAR, Local4)), Local2)
                Concatenate (Local0, Local2, Local5)
                Store (Local5, Local0)
            }

            Return (Local0)
        }

        Name (CHAR, Package (0x10)
        {
            "0", 
            "1", 
            "2", 
            "3", 
            "4", 
            "5", 
            "6", 
            "7", 
            "8", 
            "9", 
            "A", 
            "B", 
            "C", 
            "D", 
            "E", 
            "F"
        })
        Device (ADP0)
        {
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (_HID, "ACPI0003")
            Method (_PSR, 0, NotSerialized)
            {
                If (WINF)
                {
                    Return (One)
                }
                Else
                {
                    If (^^PCI0.LPC.EC0.ECOK)
                    {
                        If (ACST)
                        {
                            Store (One, PWRS)
                            Return (One)
                        }
                        Else
                        {
                            Store (Zero, PWRS)
                            Return (Zero)
                        }
                    }
                    Else
                    {
                        Return (One)
                    }
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (WMID)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, Zero)
            Name (ERRD, 0x00010000)
            Name (BUFF, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateByteField (BUFF, Zero, BF00)
            CreateByteField (BUFF, One, BF01)
            CreateByteField (BUFF, 0x02, BF02)
            CreateByteField (BUFF, 0x03, BF03)
            Name (BUF1, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (AADS, Buffer (0x04)
            {
                0x00
            })
            CreateField (AADS, Zero, 0x04, AS00)
            CreateField (AADS, 0x04, One, AS01)
            CreateField (AADS, 0x05, One, AS02)
            CreateField (AADS, 0x06, One, AS03)
            CreateField (AADS, 0x10, 0x10, AS04)
            Name (BAEF, Zero)
            Name (BADF, Zero)
            Name (BADG, Package (0x04)
            {
                One, 
                One, 
                Zero, 
                One
            })
            Name (BADS, Package (0x05)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (WLDS, Zero)
            Name (WLED, Zero)
            Name (BTDS, Zero)
            Name (BTED, Zero)
            Name (BLDS, Zero)
            Name (BLED, Zero)
            Name (NTDC, Zero)
            Name (WLSD, 0x0100)
            Name (WLSE, 0x0101)
            Name (BLTD, 0x0200)
            Name (BLTE, 0x0201)
            Name (LBL0, 0x0300)
            Name (LBL1, 0x0301)
            Name (LBL2, 0x0302)
            Name (LBL3, 0x0303)
            Name (LBL4, 0x0304)
            Name (LBL5, 0x0305)
            Name (LBL6, 0x0306)
            Name (LBL7, 0x0307)
            Name (LBL8, 0x0308)
            Name (LBL9, 0x0309)
            Name (LBLA, 0x030A)
            Name (LBLB, 0x030B)
            Name (LBLC, 0x030C)
            Name (LBLD, 0x030D)
            Name (LBLE, 0x030E)
            Name (LBLF, 0x030F)
            Name (CADI, 0x0401)
            Name (CADO, 0x0400)
            Name (BAIO, 0x0500)
            Name (GSEF, 0x0501)
            Name (GSEV, 0x0502)
            Name (VGAO, 0x0600)
            Name (VGAI, 0x0601)
            Name (G3SD, 0x0800)
            Name (G3SE, 0x0801)
            Name (LANI, 0x0900)
            Name (LANO, 0x0901)
            Name (MOON, 0x0A01)
            Name (MOOF, 0x0A00)
            Name (BNSL, Package (0x10)
            {
                0x0300, 
                0x0301, 
                0x0302, 
                0x0303, 
                0x0304, 
                0x0305, 
                0x0306, 
                0x0307, 
                0x0308, 
                0x0309, 
                0x030A, 
                0x030B, 
                0x030C, 
                0x030D, 
                0x030E, 
                0x030F
            })
            Name (BBSB, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BBSB, Zero, 0x10, BBD0)
            CreateField (BBSB, 0x10, 0x10, BBD1)
            Name (TLS0, Zero)
            Name (TLS1, One)
            Name (TLS2, 0x02)
            Name (TLS3, 0x03)
            Name (TLS4, 0x04)
            Name (TLS5, 0x05)
            Name (TLS6, 0x06)
            Name (TLS7, 0x07)
            Name (TLSL, Package (0x07)
            {
                One, 
                0x02, 
                0x03, 
                0x04, 
                0x05, 
                0x06, 
                0x07
            })
            Name (BCDS, Package (0x0D)
            {
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
            })
            Name (BDDS, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BDDS, Zero, 0x10, BDD0)
            CreateField (BDDS, 0x10, 0x10, BDD1)
            Name (DSY0, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY1, Buffer (0x18)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY2, Buffer (0x10)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY3, Buffer (0x18)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY4, Buffer (0x10)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (DSY5, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY0, Zero, 0x40, DY00)
            CreateField (DSY0, 0x40, 0x40, DY01)
            CreateField (DSY0, 0x80, 0x40, DY02)
            CreateField (DSY0, 0xC0, 0x40, DY03)
            CreateField (DSY0, 0x0100, 0x40, DY04)
            CreateField (DSY1, Zero, 0x40, DY10)
            CreateField (DSY1, 0x40, 0x40, DY11)
            CreateField (DSY1, 0x80, 0x40, DY12)
            CreateField (DSY2, Zero, 0x40, DY20)
            CreateField (DSY2, 0x40, 0x10, DY21)
            CreateField (DSY2, 0x50, 0x10, DY22)
            CreateField (DSY0, Zero, 0xC0, DSX4)
            Name (BEDS, Package (0x10)
            {
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000, 
                0x00010000
            })
            Name (WIT0, Zero)
            Name (DSY6, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY6, Zero, 0x20, DY60)
            CreateField (DSY6, 0x20, 0x20, DY61)
            CreateField (DSY6, 0x40, 0x20, DY62)
            CreateField (DSY6, 0x60, 0x20, DY63)
            CreateField (DSY6, 0x80, 0x20, DY64)
            Name (WPRW, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPRW, Zero, 0x08, WWD0)
            CreateField (WPRW, 0x08, 0x08, WWD1)
            CreateField (WPRW, 0x10, 0x08, WWD2)
            CreateField (WPRW, 0x18, 0x08, WWD3)
            CreateField (WPRW, 0x20, 0x08, WWD4)
            CreateField (WPRW, 0x28, 0x20, WWD5)
            Name (WPCI, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPCI, Zero, 0x08, WPIR)
            CreateField (WPCI, 0x08, 0x03, WPIF)
            CreateField (WPCI, 0x0B, 0x05, WPID)
            CreateField (WPCI, 0x10, 0x08, WPIB)
            Name (DSY7, Buffer (0x14)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY7, Zero, 0x20, DYB0)
            CreateField (DSY7, 0x20, 0x20, DYB1)
            CreateField (DSY7, 0x40, 0x20, DYB2)
            CreateField (DSY7, 0x60, 0x20, DYB3)
            CreateField (DSY7, 0x80, 0x20, DYB4)
            Name (PCIA, Buffer (0x08)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (PCIA, Zero, 0x20, DEVT)
            CreateField (PCIA, 0x20, 0x20, FUNT)
            Name (BTFV, Buffer (0x02)
            {
                0x00, 0x00
            })
            CreateField (BTFV, Zero, 0x08, BTF0)
            CreateField (BTFV, Zero, 0x08, BTF1)
            Name (BPCH, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BPCH, Zero, 0x10, BHDA)
            CreateField (BPCH, 0x10, 0x10, BHER)
            Name (BPCS, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BPCS, Zero, 0x10, BSDA)
            CreateField (BPCS, 0x10, 0x10, BSER)
            Name (BIN2, Buffer (0x08)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (BIN2, Zero, 0x20, BI2L)
            CreateField (BIN2, 0x20, 0x20, BI2H)
            Name (BINR, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BINR, Zero, 0x10, BIDA)
            CreateField (BINR, 0x10, 0x10, BIER)
            Name (BAMD, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BAMD, Zero, 0x08, BAML)
            CreateField (BAMD, 0x08, 0x08, BAMH)
            CreateField (BAMD, 0x10, 0x10, BAER)
            Name (BFDS, Package (0x04)
            {
                0x02, 
                0x02, 
                0x02, 
                0x02
            })
            Name (GSTS, Zero)
            Name (BFEF, Zero)
            Name (BGEF, Zero)
            Name (BGDS, Package (0x01)
            {
                One
            })
            Method (AAF1, 0, NotSerialized)
            {
                If (^^PCI0.LPC.EC0.ECOK)
                {
                    If (WEXT)
                    {
                        Store (0x07, AS00)
                    }
                    Else
                    {
                        Store (Zero, AS00)
                    }

                    Store (BEXT, AS01)
                    Store (Zero, AS02)
                    Store (G3XT, AS03)
                    Store (Zero, AS04)
                }
                Else
                {
                    Store (Zero, AS00)
                    Store (Zero, AS01)
                    Store (Zero, AS02)
                    Store (Zero, AS03)
                    Store (Zero, AS04)
                }

                Store (Zero, AS02)
            }

            Method (WGDS, 1, NotSerialized)
            {
                If (^^PCI0.LPC.EC0.ECOK)
                {
                    If (LEqual (Arg0, One))
                    {
                        Store (WSTS, Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (BSTS, Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (BRIG, Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (G3TS, Local0)
                    }
                }
                Else
                {
                    Store (Zero, Local0)
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Store (Local0, Index (BADG, 0x03))
                }
                Else
                {
                    Store (Local0, Index (BADG, Subtract (Arg0, One)))
                }
            }

            Method (WSDS, 2, NotSerialized)
            {
                If (^^PCI0.LPC.EC0.ECOK)
                {
                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, BUFF)
                        If (BF00)
                        {
                            ECW1 (0x05, 0x16)
                        }
                        Else
                        {
                            ECW1 (0x06, 0x16)
                        }
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, BUFF)
                        If (BF00)
                        {
                            ECW1 (0x07, 0x16)
                        }
                        Else
                        {
                            ECW1 (0x08, 0x16)
                        }
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        If (LNot (VSTA))
                        {
                            Store (Arg1, BUFF)
                            ECW1 (BF00, 0x4D)
                        }
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, BUFF)
                        If (BF00)
                        {
                            ECW1 (0x03, 0x16)
                        }
                        Else
                        {
                            ECW1 (0x04, 0x16)
                        }
                    }
                }
                Else
                {
                }
            }

            Method (OEMN, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0x80))
                {
                    If (WPRS)
                    {
                        If (WSTS)
                        {
                            Store (Zero, WPRS)
                            Return (WLSE)
                        }
                        Else
                        {
                            Store (Zero, WPRS)
                            Return (WLSD)
                        }
                    }

                    If (BTRS)
                    {
                        If (BSTS)
                        {
                            Store (Zero, BTRS)
                            Return (BLTE)
                        }
                        Else
                        {
                            Store (Zero, BTRS)
                            Return (BLTD)
                        }
                    }

                    If (G3RS)
                    {
                        If (G3TS)
                        {
                            Store (Zero, G3RS)
                            Return (G3SE)
                        }
                        Else
                        {
                            Store (Zero, G3RS)
                            Return (G3SD)
                        }
                    }

                    If (BKTS)
                    {
                        Store (Zero, BKTS)
                        Return (MOON)
                    }
                    Else
                    {
                        Return (MOOF)
                    }

                    If (BPRS)
                    {
                        If (LNot (VSTA))
                        {
                            Store (Zero, BPRS)
                            Store (BRIG, Local0)
                            Return (DerefOf (Index (BNSL, Local0)))
                        }
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x82))
                    {
                        If (CRTS)
                        {
                            Return (VGAI)
                        }
                        Else
                        {
                            Return (VGAO)
                        }
                    }
                    Else
                    {
                        Return (One)
                    }
                }
            }

            Method (STRL, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Store (DerefOf (Index (TLSL, Subtract (Arg0, One))), THDY)
                    Store (One, THEN)
                }
                Else
                {
                    Store (Arg0, THEN)
                }
            }

            Method (WODP, 2, NotSerialized)
            {
            }

            Method (GCPU, 1, NotSerialized)
            {
            }

            Method (MSRR, 1, NotSerialized)
            {
            }

            Method (MSRW, 1, NotSerialized)
            {
            }

            Method (C4C3, 2, NotSerialized)
            {
                Store (Arg0, ^^PCI0.LPC.CFCT)
            }

            Method (CPUF, 0, NotSerialized)
            {
            }

            Method (CPUT, 0, NotSerialized)
            {
            }

            Method (PCIR, 1, NotSerialized)
            {
            }

            Method (PCIW, 1, NotSerialized)
            {
            }

            Method (CPUS, 0, NotSerialized)
            {
            }

            Method (PCID, 1, NotSerialized)
            {
                Store (IHWM (0x06, Arg0), Local2)
                Store (Local2, DSY6)
            }

            Method (BTIF, 2, NotSerialized)
            {
            }

            Method (CKGS, 0, NotSerialized)
            {
                Store (Zero, GSTS)
                Return (GSTS)
            }

            Method (WSHP, 1, NotSerialized)
            {
            }

            Method (WSSL, 1, NotSerialized)
            {
            }

            Method (WSSP, 1, NotSerialized)
            {
            }

            Method (WSSE, 1, NotSerialized)
            {
            }

            Method (WSVE, 1, NotSerialized)
            {
            }

            Name (_WDG, Buffer (0xDC)
            {
                /* 0000 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                /* 0008 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                /* 0010 */    0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                /* 0018 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                /* 0020 */    0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02, 
                /* 0028 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                /* 0030 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                /* 0038 */    0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                /* 0040 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                /* 0048 */    0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02, 
                /* 0050 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                /* 0058 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                /* 0060 */    0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                /* 0068 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                /* 0070 */    0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02, 
                /* 0078 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                /* 0080 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                /* 0088 */    0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7, 
                /* 0090 */    0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3, 
                /* 0098 */    0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02, 
                /* 00A0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                /* 00A8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                /* 00B0 */    0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB, 
                /* 00B8 */    0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86, 
                /* 00C0 */    0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08, 
                /* 00C8 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                /* 00D0 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                /* 00D8 */    0x82, 0x00, 0x01, 0x08
            })
            Method (WQAA, 1, NotSerialized)
            {
                Store (0x10, P80H)
                AAF1 ()
                Store (AADS, BUFF)
                Return (BUFF)
            }

            Method (WMBA, 3, NotSerialized)
            {
                Store (0x11, P80H)
                If (LEqual (Arg1, One))
                {
                    Store (Arg1, Local0)
                    WGDS (Local0)
                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg1, Local0)
                    WGDS (Local0)
                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg1, Local0)
                    WGDS (Local0)
                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x04))
                {
                    WSDS (Arg1, Arg2)
                    Store (DerefOf (Index (BADS, Zero)), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    WSDS (Arg1, Arg2)
                    Store (DerefOf (Index (BADS, One)), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    WSDS (Arg1, Arg2)
                    Store (DerefOf (Index (BADS, 0x02)), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, BAEF)
                    Store (DerefOf (Index (BADS, 0x03)), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Return (One)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Return (0x0F)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Store (Arg1, Local0)
                    WGDS (Local0)
                    Store (DerefOf (Index (BADG, 0x03)), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    WSDS (Arg1, Arg2)
                    Store (DerefOf (Index (BADS, 0x04)), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0C)) {}
                If (LEqual (Arg1, 0x0D))
                {
                    Return (BKTS)
                }
            }

            Method (_WED, 1, NotSerialized)
            {
                Store (0x12, P80H)
                OEMN (Arg0)
            }

            Method (WMBB, 3, NotSerialized)
            {
                If (LEqual (Arg1, One))
                {
                    If (THEN)
                    {
                        Store (DerefOf (Index (TLSL, Subtract (THDY, One))), BBD0)
                        Store (Zero, BBD1)
                        Store (BBSB, BUFF)
                    }
                    Else
                    {
                        Store (Zero, BBD0)
                        Store (Zero, BBD1)
                        Store (Zero, BUFF)
                    }
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, Local0)
                    STRL (Local0)
                    Store (Zero, BUFF)
                }

                Return (BUFF)
            }

            Method (WMBC, 3, NotSerialized)
            {
                Store (0x14, P80H)
                WODP (Arg1, Arg2)
                If (LLessEqual (Arg1, 0x05))
                {
                    Store (0x00010000, BUFF)
                }
                Else
                {
                    Store (0x00010000, BUFF)
                }

                Return (BUFF)
            }

            Name (DETT, Zero)
            Name (FUTT, Zero)
            Name (BNPC, 0x0A)
            Name (BNMT, 0x0A)
            Name (BN13, 0x0A)
            Name (BNNE, 0x02)
            Name (DNPC, 0x06)
            Name (DNMT, 0x06)
            Name (DN13, 0x06)
            Name (DNNE, Zero)
            Name (FNPC, Zero)
            Name (FNMT, 0x02)
            Name (FN13, One)
            Name (FNNE, Zero)
            Method (WMBD, 3, NotSerialized)
            {
                Store (0x15, P80H)
                If (LEqual (Arg1, One))
                {
                    Store (Arg2, BUFF)
                    Store (BUFF, Local0)
                    Store (Arg2, WIT0)
                    GCPU (WIT0)
                    Return (DSY0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    MSRR (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg2, Local0)
                    MSRW (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, Local0)
                    C4C3 (Local0, Zero)
                    Store (Zero, BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (0xA3, P80H)
                    Store (^^PCI0.LPC.CFCT, BF00)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    CPUF ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    CPUT ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Store (Arg2, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Concatenate (WPCI, WWD0, Local0)
                    PCIR (Local0)
                    Return (DSY2)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (Arg2, DSY6)
                    Store (DY60, Local0)
                    Store (Arg2, DSY0)
                    Store (DY01, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Store (WPCI, Local1)
                    Concatenate (DY60, WPCI, Local0)
                    Concatenate (Local0, WWD0, Local1)
                    PCIW (Local1)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    CPUS ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    Store (Arg2, PCIA)
                    Store (DEVT, DETT)
                    Store (FUNT, FUTT)
                    Store (Zero, DYB0)
                    Store (Zero, DYB1)
                    Store (Zero, DYB2)
                    Store (Zero, DYB3)
                    Store (Zero, DYB4)
                    If (LEqual (FUTT, Zero))
                    {
                        If (LEqual (DETT, Zero))
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }

                        If (LEqual (DETT, One))
                        {
                            Store (FNPC, DYB0)
                            Store (DNPC, DYB1)
                            Store (BNPC, DYB2)
                            Store (Zero, DYB3)
                            Store (Zero, DYB4)
                            Return (DSY7)
                        }
                        Else
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }
                    }

                    If (LEqual (FUTT, One))
                    {
                        If (LEqual (DETT, Zero))
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }

                        If (LEqual (DETT, One))
                        {
                            Store (FNMT, DYB0)
                            Store (DNMT, DYB1)
                            Store (BNMT, DYB2)
                            Store (Zero, DYB3)
                            Store (Zero, DYB4)
                            Return (DSY7)
                        }
                        Else
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }
                    }

                    If (LEqual (FUTT, 0x02))
                    {
                        If (LEqual (DETT, Zero))
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }

                        If (LEqual (DETT, One))
                        {
                            Store (FN13, DYB0)
                            Store (DN13, DYB1)
                            Store (BN13, DYB2)
                            Store (Zero, DYB3)
                            Store (Zero, DYB4)
                            Return (DSY7)
                        }
                        Else
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }
                    }

                    If (LEqual (FUTT, 0x03))
                    {
                        If (LEqual (DETT, Zero))
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (One, DYB3)
                            Store (Zero, DYB4)
                            Return (DSY7)
                        }

                        If (LEqual (DETT, One))
                        {
                            Store (FNNE, DYB0)
                            Store (DNNE, DYB1)
                            Store (BNNE, DYB2)
                            Store (Zero, DYB3)
                            Store (Zero, DYB4)
                            Return (DSY7)
                        }
                        Else
                        {
                            Store (Zero, DYB0)
                            Store (Zero, DYB1)
                            Store (Zero, DYB2)
                            Store (Zero, DYB3)
                            Store (0x02, DYB4)
                            Return (DSY7)
                        }
                    }
                    Else
                    {
                        Store (Zero, DYB0)
                        Store (Zero, DYB1)
                        Store (Zero, DYB2)
                        Store (Zero, DYB3)
                        Store (Zero, DYB4)
                        Return (DSY7)
                    }
                }

                Return (One)
            }

            Name (BATI, Zero)
            Name (BATN, Zero)
            Method (WMBE, 3, NotSerialized)
            {
                Store (0x16, P80H)
                If (LEqual (Arg1, 0x11))
                {
                    Store (Zero, BSER)
                    Store (0x03B1, BSDA)
                    Return (BPCS)
                }

                If (LEqual (Arg1, 0x12))
                {
                    Store (Zero, BHER)
                    Store (0x02F4, BHDA)
                    Return (BPCH)
                }

                If (LEqual (Arg1, 0x13))
                {
                    Store (Arg2, BIN2)
                    Store (BI2H, BATI)
                    Store (BI2L, BATN)
                    If (LEqual (BATI, One))
                    {
                        If (LEqual (BATN, 0x03))
                        {
                            Store (RDEC (0xD0), BAML)
                            Store (RDEC (0xD1), BAMH)
                            Store (Zero, BAER)
                            Return (BAMD)
                        }

                        If (LEqual (BATN, 0x18))
                        {
                            Store (RDEC (0xCE), Local0)
                            If (LEqual (Local0, 0x31))
                            {
                                Store (0x1130, BIDA)
                            }

                            If (LEqual (Local0, 0x32))
                            {
                                Store (0x12C0, BIDA)
                            }

                            Store (Zero, BIER)
                            Return (BINR)
                        }

                        If (LEqual (BATN, 0x19))
                        {
                            Store (RDEC (0xD2), BAML)
                            Store (RDEC (0xD3), BAMH)
                            Store (Zero, BAER)
                            Return (BAMD)
                        }
                    }

                    If (LEqual (BATI, 0x02))
                    {
                        If (LEqual (BATN, 0x03))
                        {
                            Store (0x02, BIER)
                            Return (BINR)
                        }

                        If (LEqual (BATN, 0x18))
                        {
                            Store (0x02, BIER)
                            Return (BINR)
                        }

                        If (LEqual (BATN, 0x19))
                        {
                            Store (0x02, BIER)
                            Return (BINR)
                        }
                    }

                    If (LEqual (BATI, 0x03))
                    {
                        If (LEqual (BATN, 0x03))
                        {
                            Store (0x02, BIER)
                            Return (BINR)
                        }

                        If (LEqual (BATN, 0x18))
                        {
                            Store (0x02, BIER)
                            Return (BINR)
                        }

                        If (LEqual (BATN, 0x19))
                        {
                            Store (0x02, BIER)
                            Return (BINR)
                        }
                    }
                }
            }

            Method (WMBF, 3, NotSerialized)
            {
            }

            Method (WMBG, 3, NotSerialized)
            {
                Store (0x18, P80H)
                Store (Arg2, BUFF)
                Store (Zero, BUFF)
                Return (BUFF)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Method (_INI, 0, NotSerialized)
            {
                Store (0x07D0, OSYS)
                If (CondRefOf (_OSI, Local0))
                {
                    Store (Zero, VSTA)
                    Sleep (0x0A)
                    If (_OSI ("Linux"))
                    {
                        Store (0x03E8, OSYS)
                    }

                    If (_OSI ("Windows 2001"))
                    {
                        Store (0x07D1, OSYS)
                    }

                    If (_OSI ("Windows 2001 SP1"))
                    {
                        Store (0x07D1, OSYS)
                    }

                    If (_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x07D2, OSYS)
                    }

                    If (_OSI ("Windows 2006"))
                    {
                        Store (0x07D6, OSYS)
                        Store (One, VSTA)
                        Sleep (0x0A)
                    }

                    If (LOr (LEqual (OSYS, 0x07D1), LEqual (OSYS, 0x07D2))) {}
                }
            }

            Name (_BBN, Zero)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                        Offset (0x08), 
                MHEN,   1, 
                    ,   13, 
                MHBR,   18, 
                        Offset (0x20), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                        Offset (0x28), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                        Offset (0x30), 
                IPEN,   1, 
                    ,   11, 
                IPBR,   20, 
                        Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                        Offset (0x62), 
                TUUD,   16, 
                        Offset (0x70), 
                    ,   4, 
                TLUD,   12, 
                        Offset (0x89), 
                    ,   3, 
                GTSE,   1, 
                        Offset (0x8A)
            }

            OperationRegion (MCHT, SystemMemory, 0xFED11000, 0xFF)
            Field (MCHT, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x1E), 
                T0IS,   16, 
                        Offset (0x5E), 
                T1IS,   16, 
                        Offset (0xEF), 
                ESCS,   8
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED44FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                ShiftLeft (TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (LEqual (GPIC, Zero))
                {
                    Return (Package (0x1B)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            Zero, 
                            ^LPC.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            Zero, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            One, 
                            ^LPC.LNKF, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            ^LPC.LNKG, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            ^LPC.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            ^LPC.LNKH, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            ^LPC.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            ^LPC.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            ^LPC.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            ^LPC.LNKA, 
                            Zero
                        }
                    })
                }
                Else
                {
                    Return (Package (0x1B)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            Zero, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            Zero, 
                            0x10
                        }
                    })
                }
            }

            Device (WMI1)
            {
                Name (_HID, "pnp0c14")
                Name (_UID, "MXM2")
                Name (_WDG, Buffer (0x3C)
                {
                    /* 0000 */    0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E, 
                    /* 0008 */    0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0, 
                    /* 0010 */    0x4D, 0x58, 0x01, 0x02, 0x57, 0x93, 0x8A, 0xF2, 
                    /* 0018 */    0x4B, 0xCF, 0x1A, 0x4A, 0x88, 0x93, 0xBB, 0x1F, 
                    /* 0020 */    0x58, 0xEE, 0xA1, 0xAF, 0xD1, 0x00, 0x01, 0x08, 
                    /* 0028 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                    /* 0030 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                    /* 0038 */    0x58, 0x4D, 0x01, 0x00
                })
                Method (WMMX, 3, NotSerialized)
                {
                    If (LGreaterEqual (SizeOf (Arg2), 0x04))
                    {
                        CreateDWordField (Arg2, Zero, FUNC)
                        CreateDWordField (Arg2, 0x04, ARGS)
                        If (LEqual (FUNC, 0x494D584D))
                        {
                            Return (^^PEGP.NVGA.MXMI (ARGS))
                        }
                        Else
                        {
                            If (LEqual (FUNC, 0x534D584D))
                            {
                                Return (^^PEGP.NVGA.MXMS (ARGS))
                            }
                            Else
                            {
                                If (LEqual (FUNC, 0x584D584D))
                                {
                                    If (LGreaterEqual (SizeOf (Arg1), 0x08))
                                    {
                                        CreateDWordField (Arg1, 0x08, SARG)
                                        If (LEqual (ARGS, 0x80000100))
                                        {
                                            Return (^^PEGP.NVGA.CRT0.MXMX (SARG))
                                        }
                                        Else
                                        {
                                            If (LEqual (ARGS, 0x0110))
                                            {
                                                Return (^^PEGP.NVGA.LCD0.MXMX (SARG))
                                            }
                                            Else
                                            {
                                                If (LEqual (ARGS, 0x80000210))
                                                {
                                                    Return (^^PEGP.NVGA.HDV0.MXMX (SARG))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Return (Zero)
                }

                Name (WQXM, Buffer (0x029C)
                {
                    /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x8B, 0x02, 0x00, 0x00, 0x0C, 0x08, 0x00, 0x00, 
                    /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                    /* 0018 */    0x18, 0xD2, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42, 
                    /* 0020 */    0x10, 0x05, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04, 
                    /* 0028 */    0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20, 
                    /* 0030 */    0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84, 
                    /* 0038 */    0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA, 
                    /* 0040 */    0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42, 
                    /* 0048 */    0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61, 
                    /* 0050 */    0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92, 
                    /* 0058 */    0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1, 
                    /* 0060 */    0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2, 
                    /* 0068 */    0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82, 
                    /* 0070 */    0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C, 
                    /* 0078 */    0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC, 
                    /* 0080 */    0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 
                    /* 0088 */    0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63, 
                    /* 0090 */    0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0, 
                    /* 0098 */    0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x8D, 0x02, 0xB4, 
                    /* 00A0 */    0x09, 0x70, 0x28, 0x40, 0xA1, 0x00, 0x6B, 0x18, 
                    /* 00A8 */    0x72, 0x06, 0x21, 0x5B, 0xD8, 0xC2, 0x68, 0x50, 
                    /* 00B0 */    0x80, 0x45, 0x14, 0x8D, 0xE0, 0x2C, 0x2A, 0x9E, 
                    /* 00B8 */    0x93, 0x50, 0x02, 0xDA, 0x1B, 0x82, 0xF0, 0x8C, 
                    /* 00C0 */    0xD9, 0x18, 0x9E, 0x10, 0x83, 0x54, 0x86, 0x21, 
                    /* 00C8 */    0x88, 0xB8, 0x11, 0x8E, 0xA5, 0xFD, 0x41, 0x10, 
                    /* 00D0 */    0xF9, 0xAB, 0xD7, 0xB8, 0x1D, 0x69, 0x34, 0xA8, 
                    /* 00D8 */    0xB1, 0x26, 0x38, 0x76, 0x8F, 0xE6, 0x84, 0x3B, 
                    /* 00E0 */    0x17, 0x20, 0x7D, 0x6E, 0x02, 0x39, 0xBA, 0xD3, 
                    /* 00E8 */    0xA8, 0x73, 0xD0, 0x64, 0x78, 0x0C, 0x2B, 0xC1, 
                    /* 00F0 */    0x7F, 0x80, 0x4F, 0x01, 0x78, 0xD7, 0x80, 0x9A, 
                    /* 00F8 */    0xFE, 0xC1, 0x33, 0x41, 0x70, 0xA8, 0x21, 0x7A, 
                    /* 0100 */    0xD4, 0xE1, 0x4E, 0xE0, 0xBC, 0x8E, 0x84, 0x41, 
                    /* 0108 */    0x1C, 0xD1, 0x71, 0x63, 0x67, 0x75, 0x32, 0x07, 
                    /* 0110 */    0x5D, 0xAA, 0x00, 0xB3, 0x07, 0x00, 0x0D, 0x2E, 
                    /* 0118 */    0xC1, 0x69, 0x9F, 0x49, 0xE8, 0xF7, 0x80, 0xF3, 
                    /* 0120 */    0xE9, 0x79, 0x6C, 0x6C, 0x10, 0xA8, 0x91, 0xF9, 
                    /* 0128 */    0xFF, 0x0F, 0xED, 0x41, 0x9E, 0x56, 0xCC, 0x90, 
                    /* 0130 */    0xCF, 0x02, 0x87, 0xC5, 0xC4, 0x1E, 0x19, 0xE8, 
                    /* 0138 */    0x78, 0xC0, 0x7F, 0x00, 0x78, 0x34, 0x88, 0xF0, 
                    /* 0140 */    0x66, 0xE0, 0xF9, 0x9A, 0x60, 0x50, 0x08, 0x39, 
                    /* 0148 */    0x19, 0x0F, 0x4A, 0xCC, 0xF9, 0x80, 0xCC, 0x25, 
                    /* 0150 */    0xC4, 0x43, 0xC0, 0x31, 0xC4, 0x08, 0x7A, 0x46, 
                    /* 0158 */    0x45, 0x23, 0x6B, 0x22, 0x3E, 0x03, 0x78, 0xDC, 
                    /* 0160 */    0x96, 0x05, 0x42, 0x09, 0x0C, 0xEC, 0x73, 0xC3, 
                    /* 0168 */    0x3B, 0x84, 0x61, 0x71, 0xA3, 0x09, 0xEC, 0xF3, 
                    /* 0170 */    0x85, 0x05, 0x0E, 0x0A, 0x05, 0xEB, 0xBB, 0x42, 
                    /* 0178 */    0xCC, 0xE7, 0x81, 0xE3, 0x3C, 0x60, 0x0B, 0x9F, 
                    /* 0180 */    0x28, 0x01, 0x3E, 0x24, 0x8F, 0x06, 0xDE, 0x20, 
                    /* 0188 */    0xE1, 0x5B, 0x3F, 0x02, 0x10, 0xE0, 0x27, 0x06, 
                    /* 0190 */    0x13, 0x58, 0x1E, 0x30, 0x7A, 0x94, 0xF6, 0x2B, 
                    /* 0198 */    0x00, 0x21, 0xF8, 0x8B, 0xC5, 0x53, 0xC0, 0xEB, 
                    /* 01A0 */    0x40, 0x84, 0x63, 0x81, 0x29, 0x72, 0x6C, 0x68, 
                    /* 01A8 */    0x78, 0x7E, 0x70, 0x88, 0x1E, 0xF5, 0x5C, 0xC2, 
                    /* 01B0 */    0x1F, 0x4D, 0x94, 0x53, 0x38, 0x1C, 0x1F, 0x39, 
                    /* 01B8 */    0x8C, 0x10, 0xFE, 0x49, 0xE3, 0xC9, 0xC3, 0x9A, 
                    /* 01C0 */    0xEF, 0x00, 0x9A, 0xD2, 0x5B, 0xC0, 0xFB, 0x83, 
                    /* 01C8 */    0x47, 0x80, 0x11, 0x20, 0xE1, 0x68, 0x82, 0x89, 
                    /* 01D0 */    0x7C, 0x3A, 0x01, 0xD5, 0xFF, 0xFF, 0x74, 0x02, 
                    /* 01D8 */    0xB8, 0xBA, 0x01, 0x14, 0x37, 0x6A, 0x9D, 0x49, 
                    /* 01E0 */    0x7C, 0x2C, 0xF1, 0xAD, 0xE4, 0xBC, 0x43, 0xC5, 
                    /* 01E8 */    0x7F, 0x93, 0x78, 0x3A, 0xF1, 0x34, 0x1E, 0x4C, 
                    /* 01F0 */    0x42, 0x44, 0x89, 0x18, 0x21, 0xA2, 0xEF, 0x27, 
                    /* 01F8 */    0x46, 0x08, 0x15, 0x31, 0x6C, 0xA4, 0x37, 0x80, 
                    /* 0200 */    0xE7, 0x13, 0xE3, 0x84, 0x08, 0xF4, 0x74, 0xC2, 
                    /* 0208 */    0x42, 0x3E, 0x34, 0xA4, 0xE1, 0x74, 0x02, 0x50, 
                    /* 0210 */    0xE0, 0xFF, 0x7F, 0x3A, 0x81, 0x1F, 0xF5, 0x74, 
                    /* 0218 */    0x82, 0x1E, 0xAE, 0x4F, 0x19, 0x18, 0xE4, 0x03, 
                    /* 0220 */    0xF2, 0xA9, 0xC3, 0xF7, 0x1F, 0x13, 0xF8, 0x78, 
                    /* 0228 */    0xC2, 0x45, 0x1D, 0x4F, 0x50, 0xA7, 0x07, 0x1F, 
                    /* 0230 */    0x4F, 0xD8, 0x19, 0xE1, 0x2C, 0x1E, 0x03, 0x7C, 
                    /* 0238 */    0x3A, 0xC1, 0xDC, 0x13, 0x7C, 0x3A, 0x01, 0xDB, 
                    /* 0240 */    0x68, 0x60, 0x1C, 0x4F, 0xC0, 0x77, 0x74, 0xC1, 
                    /* 0248 */    0x1D, 0x4F, 0xC0, 0x30, 0x18, 0x18, 0xE7, 0x13, 
                    /* 0250 */    0xE0, 0x31, 0x5E, 0xDC, 0x31, 0xC0, 0x43, 0xE0, 
                    /* 0258 */    0x03, 0x78, 0xDC, 0x38, 0x3D, 0x2B, 0x9D, 0x14, 
                    /* 0260 */    0xF2, 0x24, 0xC2, 0x07, 0x85, 0x39, 0xB0, 0xE0, 
                    /* 0268 */    0x14, 0xDA, 0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83, 
                    /* 0270 */    0x32, 0x35, 0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52, 
                    /* 0278 */    0x63, 0xC6, 0xCE, 0x19, 0x0E, 0xF8, 0x10, 0xD0, 
                    /* 0280 */    0x89, 0xC0, 0xF2, 0x9E, 0x0D, 0x02, 0xB1, 0x0C, 
                    /* 0288 */    0x0A, 0x81, 0x58, 0xFA, 0xAB, 0x45, 0x20, 0x0E, 
                    /* 0290 */    0x0E, 0xA2, 0xFF, 0x3F, 0x88, 0x23, 0xD2, 0x0A, 
                    /* 0298 */    0xC4, 0xFF, 0x7F, 0x7F
                })
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Device (EVGA)
                {
                    Name (_ADR, Zero)
                    Name (CRTA, One)
                    Name (LCDA, One)
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x0100, 
                            0x0110, 
                            0x0200
                        })
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_BCL, 0, NotSerialized)
                        {
                            P8XH (Zero, 0xF0)
                            Return (Package (0x0C)
                            {
                                0x50, 
                                0x14, 
                                0x0A, 
                                0x14, 
                                0x1E, 
                                0x28, 
                                0x32, 
                                0x3C, 
                                0x46, 
                                0x50, 
                                0x5A, 
                                0x64
                            })
                            P8XH (Zero, 0x0F)
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            P8XH (Zero, 0xF1)
                            Store (Zero, BPRS)
                            Sleep (0x0A)
                            Name (BBCM, Package (0x0A)
                            {
                                Zero, 
                                One, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09
                            })
                            P8XH (Zero, 0xF2)
                            Divide (Arg0, 0x0A, Local0, Local2)
                            Store (Subtract (Local2, One), Local3)
                            Store (DerefOf (Index (BBCM, Local3)), Local4)
                            P8XH (Zero, 0xF3)
                            While (ECMC) {}
                            P8XH (Zero, 0xF4)
                            Store (Local4, DAT0)
                            Sleep (0x0A)
                            Store (0x4D, ECMC)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            P8XH (Zero, 0xF5)
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }

                            P8XH (Zero, 0xF6)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            P8XH (Zero, 0xF7)
                            If (LCDA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            P8XH (Zero, 0xF8)
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            P8XH (Zero, 0xF9)
                            If (BPRS)
                            {
                                Store (Zero, BPRS)
                                Sleep (0x0A)
                                Name (BBQC, Package (0x0A)
                                {
                                    Zero, 
                                    One, 
                                    0x02, 
                                    0x03, 
                                    0x04, 
                                    0x05, 
                                    0x06, 
                                    0x07, 
                                    0x08, 
                                    0x09
                                })
                                Store (BRIG, Local0)
                                Sleep (0x0A)
                                Store (DerefOf (Index (BBQC, Local0)), Local1)
                                Store (Add (Local1, One), Local2)
                                Store (Multiply (Local2, 0x0A), Local3)
                                Return (Local3)
                            }

                            P8XH (Zero, 0xFA)
                        }
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }
                    }
                }

                Device (NVGA)
                {
                    Name (_ADR, Zero)
                    Name (CRTA, One)
                    Name (LCDA, One)
                    Name (MXM2, Buffer (0x43)
                    {
                        /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x02, 0x01, 0x3B, 0x00, 
                        /* 0008 */    0x00, 0x00, 0xFA, 0xFF, 0xF9, 0x3E, 0x20, 0x21, 
                        /* 0010 */    0x8A, 0xF7, 0xF9, 0x00, 0x30, 0x12, 0xB8, 0xFF, 
                        /* 0018 */    0xF9, 0x3E, 0x60, 0x68, 0x92, 0xFF, 0xF9, 0x3E, 
                        /* 0020 */    0x01, 0xBC, 0x02, 0x00, 0x02, 0x6E, 0x00, 0x00, 
                        /* 0028 */    0x12, 0x7D, 0x00, 0x00, 0x03, 0x28, 0xA0, 0x00, 
                        /* 0030 */    0x13, 0x30, 0x90, 0x01, 0x04, 0x20, 0x08, 0x10, 
                        /* 0038 */    0x00, 0x01, 0x06, 0xE8, 0x03, 0x64, 0x00, 0x96, 
                        /* 0040 */    0x00, 0x00, 0x41
                    })
                    Name (MXM1, Buffer (0x19)
                    {
                        /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x01, 0x01, 0x18, 0x00, 
                        /* 0008 */    0x00, 0x60, 0x02, 0x10, 0x02, 0x01, 0x07, 0x03, 
                        /* 0010 */    0x58, 0x0A, 0x00, 0x13, 0x2C, 0x05, 0x00, 0x70, 
                        /* 0018 */    0x70
                    })
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x0110, 
                            0x80000100, 
                            0x80000210
                        })
                    }

                    Device (CRT0)
                    {
                        Name (_ADR, 0x80000100)
                        Method (MXMX, 1, NotSerialized)
                        {
                            Return (One)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (LCD0)
                    {
                        Name (_ADR, 0x0110)
                        Method (MXMX, 1, NotSerialized)
                        {
                            Return (One)
                        }

                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (Package (0x0C)
                            {
                                0x50, 
                                0x14, 
                                0x0A, 
                                0x14, 
                                0x1E, 
                                0x28, 
                                0x32, 
                                0x3C, 
                                0x46, 
                                0x50, 
                                0x5A, 
                                0x64
                            })
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            Store (Zero, BPRS)
                            Sleep (0x0A)
                            Name (BBCM, Package (0x0A)
                            {
                                Zero, 
                                One, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09
                            })
                            P8XH (Zero, Arg0)
                            Divide (Arg0, 0x0A, Local0, Local2)
                            Store (Subtract (Local2, One), Local3)
                            Store (DerefOf (Index (BBCM, Local3)), Local4)
                            While (ECMC) {}
                            Store (Local4, DAT0)
                            Sleep (0x0A)
                            Store (0x4D, ECMC)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            If (BPRS)
                            {
                                Store (Zero, BPRS)
                                Sleep (0x0A)
                                Name (BBQC, Package (0x0A)
                                {
                                    Zero, 
                                    One, 
                                    0x02, 
                                    0x03, 
                                    0x04, 
                                    0x05, 
                                    0x06, 
                                    0x07, 
                                    0x08, 
                                    0x09
                                })
                                Store (BRIG, Local0)
                                Sleep (0x0A)
                                Store (DerefOf (Index (BBQC, Local0)), Local1)
                                Store (Add (Local1, One), Local2)
                                Store (Multiply (Local2, 0x0A), Local3)
                                Return (Local3)
                            }
                        }
                    }

                    Device (HDV0)
                    {
                        Name (_ADR, 0x80000210)
                        Method (MXMX, 1, NotSerialized)
                        {
                            Return (One)
                        }
                    }

                    Method (MXMI, 1, NotSerialized)
                    {
                        Return (0x21)
                    }

                    Method (MXMS, 1, NotSerialized)
                    {
                        Return (MXM2)
                    }
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKD, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (OVGA)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x07), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x03)
                    {
                        0x00010100, 
                        0x00010400, 
                        0x00010200
                    })
                }

                Device (CRT1)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DTV1)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0202))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (LCD)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0400)
                    }

                    Method (_BCL, 0, NotSerialized)
                    {
                        P8XH (Zero, 0xF1)
                        Return (Package (0x0C)
                        {
                            0x50, 
                            0x14, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                        P8XH (Zero, 0x1F)
                    }

                    Method (_BCM, 1, NotSerialized)
                    {
                        P8XH (Zero, 0xF2)
                        Store (Zero, BPRS)
                        Sleep (0x0A)
                        Name (BBCM, Package (0x0A)
                        {
                            Zero, 
                            One, 
                            0x02, 
                            0x03, 
                            0x04, 
                            0x05, 
                            0x06, 
                            0x07, 
                            0x08, 
                            0x09
                        })
                        P8XH (Zero, 0xF3)
                        Divide (Arg0, 0x0A, Local0, Local2)
                        Store (Subtract (Local2, One), Local3)
                        Store (DerefOf (Index (BBCM, Local3)), Local4)
                        P8XH (Zero, 0xF4)
                        While (ECMC) {}
                        P8XH (Zero, 0xF5)
                        Store (Local4, DAT0)
                        Sleep (0x0A)
                        Store (0x4D, ECMC)
                        P8XH (Zero, 0xF6)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        P8XH (Zero, 0xF7)
                        If (And (CSTE, 0x0808))
                        {
                            P8XH (Zero, 0xF8)
                            Return (0x1F)
                        }

                        Return (0x1D)
                        P8XH (Zero, 0xF9)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        P8XH (Zero, 0xFA)
                        If (And (NSTE, 0x0808))
                        {
                            P8XH (Zero, 0xFB)
                            Return (One)
                        }

                        Return (Zero)
                        P8XH (Zero, 0xFC)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        P8XH (Zero, 0xFD)
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            P8XH (Zero, 0xFE)
                            Store (NSTE, CSTE)
                        }

                        P8XH (Zero, 0xFF)
                    }
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID1, Zero))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (CDDS (DID1))
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID1))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID2, Zero))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (CDDS (DID2))
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID2))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID3))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID3))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID4))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID4))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID5))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID5))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (Zero)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    If (LEqual (CADL, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    If (LEqual (NADL, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL2, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL3, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL4, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL5, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL6, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL7, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL8, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Scope (^^PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x60), 
                        TASM,   10, 
                                Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                            Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                            Offset (0x18), 
                            Offset (0xA4), 
                    ASLE,   8, 
                            Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                            Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                            Offset (0xB2), 
                            Offset (0xB5), 
                    LBPC,   8, 
                            Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                            Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                            Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                            Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                            Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                            Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                            Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                Name (DBTB, Package (0x15)
                {
                    Zero, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, One)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (0x0679, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            And (PARM, 0xEFFF0000, PARM)
                            And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), 
                                PARM)
                            Or (IBTT, PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, One, PARM)
                            Or (PARM, ShiftLeft (GMFN, One), PARM)
                            Or (PARM, 0x1800, PARM)
                            Or (PARM, ShiftLeft (IDMS, 0x11), PARM)
                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL
                                )), 0x15), PARM, PARM)
                            Store (One, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (Zero, PARM)
                            If (ISSC)
                            {
                                Or (PARM, 0x03, PARM)
                            }

                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            Store (KSV0, PARM)
                            Store (KSV1, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (Zero, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            If (LEqual (PARM, Zero))
                            {
                                Store (CLID, Local0)
                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID)
                                    GLID (CLID)
                                }
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, One), One, IF1E)
                            If (And (PARM, 0x0001E000))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, One))
                            {
                                If (LEqual (ShiftRight (PARM, One), One))
                                {
                                    Store (One, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (Zero, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x14))
                        {
                            And (PARM, 0x0F, PAVP)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (Zero, GEFC)
                    Store (One, SCIS)
                    Store (Zero, GSSE)
                    Store (Zero, SCIE)
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (One)
                    }

                    Store (Arg0, CEVT)
                    Store (0x03, CSTS)
                    If (LAnd (LEqual (CHPD, Zero), LEqual (Arg1, Zero)))
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                        {
                            Notify (PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (OVGA, Arg1)
                        }
                    }

                    Notify (OVGA, 0x80)
                    Return (Zero)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX)
                    Return (GNOT (One, Zero))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID)
                    Return (GNOT (0x02, Zero))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK)
                    Return (GNOT (0x04, Zero))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (One, Arg0))))
                    {
                        Return (One)
                    }

                    If (PARD ())
                    {
                        Return (One)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (CPFM)
                        {
                            And (CPFM, 0x0F, Local0)
                            And (EPFM, 0x0F, Local1)
                            If (LEqual (Local0, One))
                            {
                                If (And (Local1, 0x06))
                                {
                                    Store (0x06, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x08))
                                    {
                                        Store (0x08, PFIT)
                                    }
                                    Else
                                    {
                                        Store (One, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                If (And (Local1, 0x08))
                                {
                                    Store (0x08, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, One))
                                    {
                                        Store (One, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x06, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                If (And (Local1, One))
                                {
                                    Store (One, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x06))
                                    {
                                        Store (0x06, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x08, PFIT)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            XOr (PFIT, 0x07, PFIT)
                        }

                        Or (PFIT, 0x80000000, PFIT)
                        Store (0x04, ASLC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP)
                            Or (BCLP, 0x80000000, BCLP)
                            Store (0x02, ASLC)
                        }
                        Else
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, ALSI)
                                Store (One, ASLC)
                            }
                            Else
                            {
                                Return (One)
                            }
                        }
                    }

                    Store (Zero, LBPC)
                    Return (Zero)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, Zero))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (Zero)
                }
            }

            Device (P32)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                Zero, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                One, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x03, 
                                ^^LPC.LNKB, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x03, 
                                Zero, 
                                0x11
                            }
                        })
                    }
                }
            }

            Device (LPC)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    PARC,   8, 
                    PBRC,   8, 
                    PCRC,   8, 
                    PDRC,   8, 
                            Offset (0x28), 
                    PERC,   8, 
                    PFRC,   8, 
                    PGRC,   8, 
                    PHRC,   8, 
                            Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                            Offset (0x60), 
                        ,   7, 
                    CFCT,   1, 
                            Offset (0xB0), 
                    RAEN,   1, 
                        ,   13, 
                    RCBA,   18
                }

                OperationRegion (PRR0, PCI_Config, 0x60, 0x04)
                Field (PRR0, AnyAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8
                }

                OperationRegion (PRR1, PCI_Config, 0x68, 0x04)
                Field (PRR1, AnyAcc, NoLock, Preserve)
                {
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                OperationRegion (PRR2, PCI_Config, 0x80, 0x02)
                Field (PRR2, AnyAcc, NoLock, Preserve)
                {
                    IODL,   8, 
                    IODH,   8
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, One)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRA, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRA, 0x80, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRA, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRA, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRB, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRB, 0x80, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRB, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRB, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRC, 0x80, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRC, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRC, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRD, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRD, 0x80, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRD, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRD, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRE, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRE, 0x80, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRE, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRE, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRF, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRF, 0x80, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRF, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRF, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRG, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRG, 0x80, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRG, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRG, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (PIRH, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Or (PIRH, 0x80, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {0}
                        })
                        CreateWordField (BUF0, One, IRQW)
                        If (And (PIRH, 0x80))
                        {
                            Store (Zero, Local0)
                        }
                        Else
                        {
                            Store (One, Local0)
                        }

                        ShiftLeft (Local0, And (PIRH, 0x0F), IRQW)
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, One, IRQW)
                        FindSetRightBit (IRQW, Local0)
                        If (LNotEqual (IRQW, Zero))
                        {
                            And (Local0, 0x7F, Local0)
                            Decrement (Local0)
                        }
                        Else
                        {
                            Or (Local0, 0x80, Local0)
                        }

                        Store (Local0, PIRH)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0600,             // Range Minimum
                            0x0600,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0610,             // Range Minimum
                            0x0610,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0810,             // Range Minimum
                            0x0810,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0820,             // Range Minimum
                            0x0820,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF8000000,         // Address Base
                            0x04000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED10000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED18000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED19000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEC00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED20000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED40000,         // Address Base
                            0x00005000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED45000,         // Address Base
                            0x0004B000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Return (BUF0)
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPTS, One))
                        {
                            Return (BUF0)
                        }
                        Else
                        {
                            Return (BUF1)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y0E)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (LEqual (HPTS, One))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            If (HPTS)
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPTS, One))
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPC.HPET._Y0E._BAS, HPT0)
                            If (LEqual (HPTA, One))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPTA, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPTA, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (FPU)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (HPTS)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF800000,         // Address Base
                            0x00800000,         // Address Length
                            )
                    })
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (MOUE)
                {
                    Name (_HID, EisaId ("SYN1B19"))
                    Name (_CID, Package (0x03)
                    {
                        EisaId ("SYN1B00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_UID, One)
                    Name (_GPE, 0x16)
                    Name (ECOK, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                            Notify (ADP0, Zero)
                            Notify (BAT0, 0x81)
                            Notify (BAT0, 0x80)
                            If (LDST)
                            {
                                Store (Zero, Local0)
                            }
                            Else
                            {
                                Store (One, Local0)
                            }

                            ^^^OVGA.GLID (One)
                            Store (Local0, LIDS)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x92), 
                                Offset (0x93), 
                        SMIE,   1, 
                        WLST,   1, 
                        WLKL,   1, 
                        WLIF,   1, 
                        BTKL,   1, 
                        BTST,   1, 
                        BTDE,   1, 
                        BTON,   1, 
                        B1ST,   1, 
                        B2ST,   1, 
                            ,   2, 
                        B1CG,   1, 
                        B2CG,   1, 
                        B1CE,   1, 
                        B2CE,   1, 
                        B1DC,   1, 
                        B2DC,   1, 
                            ,   2, 
                        B1FC,   1, 
                        B2FC,   1, 
                                Offset (0x96), 
                        L1B1,   1, 
                        L1B2,   1, 
                            ,   2, 
                        L2B1,   1, 
                        L2B2,   1, 
                                Offset (0x97), 
                                Offset (0x99), 
                        BL1P,   8, 
                        BL2P,   8, 
                                Offset (0x9C), 
                        TMPS,   7, 
                                Offset (0xA1), 
                        VFAN,   8, 
                        FANR,   8, 
                        BNDT,   8, 
                        B1BL,   8, 
                        B2BL,   8, 
                        OTMP,   8, 
                        FANC,   8, 
                        B1PR,   16, 
                        LFC1,   16, 
                        B1TR,   8, 
                        B2TR,   8, 
                        FANP,   8, 
                                Offset (0xB1), 
                        B2PR,   16, 
                        LFC2,   16, 
                                Offset (0xB8), 
                        PWST,   8, 
                        B1SN,   16, 
                        B2SN,   16, 
                                Offset (0xC4), 
                        CRCN,   8, 
                        B1RC,   16, 
                        B2RC,   16, 
                                Offset (0xCA), 
                        PTDE,   8, 
                        VGAT,   8, 
                        VGLR,   8, 
                                Offset (0xCE), 
                        CCLT,   8, 
                                Offset (0xD2), 
                        B1DV,   16, 
                        B2DV,   16, 
                        B1VL,   16, 
                        B2VL,   16, 
                                Offset (0xDD), 
                        BANE,   8, 
                                Offset (0xDF), 
                        BCEL,   8
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x12, P80H)
                        Notify (\_TZ.TZ00, 0x80)
                        Notify (\_TZ.TZ01, 0x80)
                        Notify (\_TZ.TZVR, 0x80)
                        Notify (\_TZ.TZVL, 0x80)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x13, P80H)
                        Notify (ADP0, Zero)
                        While (One)
                        {
                            If (LEqual (BT0P, Zero))
                            {
                                Store (0x30, P80H)
                                Sleep (0x64)
                                Break
                            }
                            Else
                            {
                                Store (0x31, P80H)
                                While (LEqual (B0PL, Zero))
                                {
                                    Sleep (0x64)
                                }
                            }

                            Break
                        }

                        Notify (BAT0, 0x81)
                        Sleep (0x64)
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, P80H)
                        Sleep (0xC8)
                        Notify (LID0, 0x80)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        If (^^^^WMID.BAEF)
                        {
                            Store (0x15, P80H)
                            Notify (WMID, 0x80)
                        }

                        Store (0x51, P80H)
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, P80H)
                        Notify (BAT0, 0x81)
                        Notify (BAT0, 0x80)
                        Store (0x91, P80H)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, P80H)
                        If (LNMG)
                        {
                            Store (0x23, P80H)
                        }
                        Else
                        {
                            If (TBX0)
                            {
                                If (TBX6)
                                {
                                    VGAS ()
                                }
                                Else
                                {
                                }
                            }
                            Else
                            {
                                Store (One, TLST)
                                ^^^OVGA.GHDS (One)
                                Notify (PCI0, Zero)
                                Notify (OVGA, 0x80)
                            }
                        }

                        Store (0x52, P80H)
                    }

                    Method (_Q29, 0, NotSerialized)
                    {
                        Store (0x29, P80H)
                        If (^^^^WMID.BAEF)
                        {
                            Store (0x2A, P80H)
                            Notify (WMID, 0x82)
                        }

                        Store (0x92, P80H)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, P80H)
                        And (THDY, Zero, THDY)
                        Store (One, THEN)
                        Store (0x23, P80H)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, P80H)
                        And (THDY, Zero, THDY)
                        Store (Zero, THEN)
                        Store (0xEE, P80H)
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, P80H)
                        If (VSTA)
                        {
                            Store (0x51, P80H)
                            If (BPRS)
                            {
                                Store (0x52, P80H)
                                If (BIDF)
                                {
                                    Store (0x53, P80H)
                                    If (SKU0)
                                    {
                                        Store (0x54, P80H)
                                        Notify (^^^PEGP.EVGA.LCD, 0x86)
                                        Notify (^^^PEGP.NVGA.LCD0, 0x86)
                                    }

                                    Store (0x55, P80H)
                                    Notify (^^^OVGA.LCD, 0x86)
                                }
                                Else
                                {
                                    Store (0x56, P80H)
                                    If (SKU0)
                                    {
                                        Store (0x57, P80H)
                                        Notify (^^^PEGP.EVGA.LCD, 0x87)
                                        Notify (^^^PEGP.NVGA.LCD0, 0x87)
                                    }

                                    Store (0x58, P80H)
                                    Notify (^^^OVGA.LCD, 0x87)
                                }

                                Store (0x59, P80H)
                            }
                            Else
                            {
                                If (^^^^WMID.BAEF)
                                {
                                    Notify (WMID, 0x80)
                                }
                            }

                            Store (0x5A, P80H)
                        }
                        Else
                        {
                            Store (0x5B, P80H)
                            If (^^^^WMID.BAEF)
                            {
                                Store (0x5C, P80H)
                                Notify (WMID, 0x80)
                            }
                        }

                        Store (0x5D, P80H)
                    }

                    Method (VGAS, 0, NotSerialized)
                    {
                        Store (0xA0, P80H)
                        Store (CDS1, ^^^PEGP.EVGA.LCDA)
                        Store (CDS2, ^^^PEGP.EVGA.CRTA)
                        Store (CDS1, ^^^PEGP.NVGA.LCDA)
                        Store (CDS2, ^^^PEGP.NVGA.CRTA)
                        Store (0xA1, P80H)
                        Notify (^^^PEGP.EVGA, 0x80)
                        Notify (^^^PEGP.NVGA, 0x80)
                        Store (0xA2, P80H)
                    }

                    Mutex (F871, 0x00)
                    OperationRegion (ITEF, SystemIO, 0x5E, 0x02)
                    Field (ITEF, ByteAcc, Lock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, AnyAcc, NoLock, Preserve)
                    {
                                AccessAs (ByteAcc, 0x00), 
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x30), 
                        ACTR,   1
                    }

                    Device (CIR)
                    {
                        Name (_HID, EisaId ("ITE8708"))
                        Method (_STA, 0, NotSerialized)
                        {
                            Acquire (F871, 0xFFFF)
                            Store (0x12, LDN)
                            If (ACTR)
                            {
                                Store (0x0F, Local1)
                            }
                            Else
                            {
                                Store (0x0D, Local1)
                            }

                            Release (F871)
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            Acquire (F871, 0xFFFF)
                            Store (0x12, LDN)
                            Store (Zero, ACTR)
                            Release (F871)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (RSRC, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0310,             // Range Minimum
                                    0x0310,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {6}
                            })
                            Return (RSRC)
                        }
                    }
                }
            }

            Device (UHC0)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (UHC1)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (UHC2)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0007)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Device (HUB7)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)
                    }
                }
            }

            Device (UHC3)
            {
                Name (_ADR, 0x001A0000)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (UHC4)
            {
                Name (_ADR, 0x001A0001)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Device (HUB7)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)
                    }
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                OperationRegion (HDAR, PCI_Config, 0x4C, 0x10)
                Field (HDAR, WordAcc, NoLock, Preserve)
                {
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                            Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x5B), 
                    LSCX,   1, 
                            Offset (0x60), 
                            Offset (0x62), 
                    PSPX,   1, 
                            Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKD, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                            Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x5B), 
                    LSCX,   1, 
                            Offset (0x60), 
                            Offset (0x62), 
                    PSPX,   1, 
                            Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKA, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x10
                            }
                        })
                    }
                }
            }

            Device (EXP3)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                            Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x5B), 
                    LSCX,   1, 
                            Offset (0x60), 
                            Offset (0x62), 
                    PSPX,   1, 
                            Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKB, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x11
                            }
                        })
                    }
                }
            }

            Device (EXP4)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (PXCS, PCI_Config, Zero, 0xE0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    VDID,   16, 
                            Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x5B), 
                    LSCX,   1, 
                            Offset (0x60), 
                            Offset (0x62), 
                    PSPX,   1, 
                            Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKC, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x12
                            }
                        })
                    }
                }
            }

            Device (EXP5)
            {
                Name (_ADR, 0x001C0004)
                Method (_PRT, 0, NotSerialized)
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                ^^LPC.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPC.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC.LNKD, 
                                Zero
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x13
                            }
                        })
                    }
                }

                OperationRegion (PXCR, PCI_Config, Zero, 0xFF)
                Field (PXCR, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x5A), 
                        ,   3, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                        ,   2, 
                            Offset (0xD8), 
                        ,   30, 
                    HPEN,   1, 
                    PMEN,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (J382)
                {
                    Name (_ADR, Zero)
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                                Offset (0x2C), 
                        SSID,   32, 
                                Offset (0xAC), 
                        D3EF,   8, 
                                Offset (0xAE), 
                        RGAE,   8, 
                                Offset (0xB2), 
                        LAT0,   8, 
                                Offset (0xCD), 
                        RGCD,   8, 
                                Offset (0xCF), 
                        ATRB,   8, 
                                Offset (0xD3), 
                        PMC0,   8, 
                                Offset (0xDE), 
                        RGDE,   8
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LNotEqual (DVID, Ones))
                        {
                            Return (0x0A)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J381)
                {
                    Name (_ADR, 0x02)
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x2C), 
                        SSID,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J383)
                {
                    Name (_ADR, 0x03)
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x2C), 
                        SSID,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }

                Device (J384)
                {
                    Name (_ADR, 0x04)
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x2C), 
                        SSID,   32
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                            Offset (0x50), 
                    MAPV,   2
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Sleep (0xC8)
                        If (LEqual (SCFG, Zero))
                        {
                            Name (PBUF, Buffer (0x14)
                            {
                                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0010 */    0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (PBUF, Zero, PIO0)
                            CreateDWordField (PBUF, 0x04, DMA0)
                            CreateDWordField (PBUF, 0x08, PIO1)
                            CreateDWordField (PBUF, 0x0C, DMA1)
                            CreateDWordField (PBUF, 0x10, FLAG)
                            Store (GETP (PRIT), PIO0)
                            Store (GDMA (And (SYNC, One), And (ICR3, One), 
                                And (ICR0, One), SDT0, And (ICR1, One)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (PRIT, 0x4000))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (PSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                                And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, One), And (SYNC, 0x02), 
                                PRIT), FLAG)
                            Return (PBUF)
                        }
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (PRIT, 0x40F0, PRIT)
                                And (SYNC, 0x0E, SYNC)
                                Store (Zero, SDT0)
                                And (ICR0, 0x0E, ICR0)
                                And (ICR1, 0x0E, ICR1)
                                And (ICR3, 0x0E, ICR3)
                                And (ICR5, 0x0E, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x7E, W630)
                                CreateWordField (Arg1, 0x80, W640)
                                CreateWordField (Arg1, 0xB0, W880)
                                CreateWordField (Arg1, 0xBA, W930)
                                Or (PRIT, 0x8004, PRIT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (PRIT, 0x02, PRIT)
                                }

                                Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, One, SYNC)
                                    Store (SDMA (DMA0), SDT0)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, One, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, One, ICR0)
                                    }

                                    Or (ICR1, One, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (PRIT, 0x3F0F, PRIT)
                                Store (Zero, PSIT)
                                And (SYNC, 0x0D, SYNC)
                                Store (Zero, SDT1)
                                And (ICR0, 0x0D, ICR0)
                                And (ICR1, 0x0D, ICR1)
                                And (ICR3, 0x0D, ICR3)
                                And (ICR5, 0x0D, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x7E, W631)
                                CreateWordField (Arg2, 0x80, W641)
                                CreateWordField (Arg2, 0xB0, W881)
                                CreateWordField (Arg2, 0xBA, W931)
                                Or (PRIT, 0x8040, PRIT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (PRIT, 0x20, PRIT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (PRIT, 0x4000, PRIT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (PRIT, 0x80, PRIT)
                                    }
                                    Else
                                    {
                                        Or (PRIT, 0x10, PRIT)
                                        Store (SETT (PIO1, W531, W641), PSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x02, SYNC)
                                    Store (SDMA (DMA1), SDT1)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x02, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x02, ICR0)
                                    }

                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB0, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (PIB0, One, PMD0)
                                CreateByteField (PIB0, 0x08, DMD0)
                                If (And (PRIT, 0x02))
                                {
                                    If (LEqual (And (PRIT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, One))
                                {
                                    Store (Or (SDT0, 0x40), DMD0)
                                    If (And (ICR1, One))
                                    {
                                        If (And (ICR0, One))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, One))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (PIB0)
                            }
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB1, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (PIB1, One, PMD1)
                                CreateByteField (PIB1, 0x08, DMD1)
                                If (And (PRIT, 0x20))
                                {
                                    If (LEqual (And (PRIT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x02))
                                {
                                    Store (Or (SDT1, 0x40), DMD1)
                                    If (And (ICR1, 0x02))
                                    {
                                        If (And (ICR0, 0x02))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x02))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (PIB1)
                            }
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Sleep (0xC8)
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0010 */    0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x7E, W630)
                                CreateWordField (Arg1, 0x80, W640)
                                CreateWordField (Arg1, 0xB0, W880)
                                CreateWordField (Arg1, 0xBA, W930)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x7E, W631)
                                CreateWordField (Arg2, 0x80, W641)
                                CreateWordField (Arg2, 0xB0, W881)
                                CreateWordField (Arg2, 0xBA, W931)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                        }
                    }
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                            Offset (0x50), 
                    MAPV,   2
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (PBUF, Buffer (0x14)
                            {
                                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0010 */    0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (PBUF, Zero, PIO0)
                            CreateDWordField (PBUF, 0x04, DMA0)
                            CreateDWordField (PBUF, 0x08, PIO1)
                            CreateDWordField (PBUF, 0x0C, DMA1)
                            CreateDWordField (PBUF, 0x10, FLAG)
                            Store (GETP (PRIT), PIO0)
                            Store (GDMA (And (SYNC, One), And (ICR3, One), 
                                And (ICR0, One), SDT0, And (ICR1, One)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (PRIT, 0x4000))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (PSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                                And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, One), And (SYNC, 0x02), 
                                PRIT), FLAG)
                            Return (PBUF)
                        }
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (PRIT, 0x40F0, PRIT)
                                And (SYNC, 0x0E, SYNC)
                                Store (Zero, SDT0)
                                And (ICR0, 0x0E, ICR0)
                                And (ICR1, 0x0E, ICR1)
                                And (ICR3, 0x0E, ICR3)
                                And (ICR5, 0x0E, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x7E, W630)
                                CreateWordField (Arg1, 0x80, W640)
                                CreateWordField (Arg1, 0xB0, W880)
                                CreateWordField (Arg1, 0xBA, W930)
                                Or (PRIT, 0x8004, PRIT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (PRIT, 0x02, PRIT)
                                }

                                Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, One, SYNC)
                                    Store (SDMA (DMA0), SDT0)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, One, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, One, ICR0)
                                    }

                                    Or (ICR1, One, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (PRIT, 0x3F0F, PRIT)
                                Store (Zero, PSIT)
                                And (SYNC, 0x0D, SYNC)
                                Store (Zero, SDT1)
                                And (ICR0, 0x0D, ICR0)
                                And (ICR1, 0x0D, ICR1)
                                And (ICR3, 0x0D, ICR3)
                                And (ICR5, 0x0D, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x7E, W631)
                                CreateWordField (Arg2, 0x80, W641)
                                CreateWordField (Arg2, 0xB0, W881)
                                CreateWordField (Arg2, 0xBA, W931)
                                Or (PRIT, 0x8040, PRIT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (PRIT, 0x20, PRIT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (PRIT, 0x4000, PRIT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (PRIT, 0x80, PRIT)
                                    }
                                    Else
                                    {
                                        Or (PRIT, 0x10, PRIT)
                                        Store (SETT (PIO1, W531, W641), PSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x02, SYNC)
                                    Store (SDMA (DMA1), SDT1)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x02, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x02, ICR0)
                                    }

                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB0, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (PIB0, One, PMD0)
                                CreateByteField (PIB0, 0x08, DMD0)
                                If (And (PRIT, 0x02))
                                {
                                    If (LEqual (And (PRIT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, One))
                                {
                                    Store (Or (SDT0, 0x40), DMD0)
                                    If (And (ICR1, One))
                                    {
                                        If (And (ICR0, One))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, One))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (PIB0)
                            }
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (PIB1, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (PIB1, One, PMD1)
                                CreateByteField (PIB1, 0x08, DMD1)
                                If (And (PRIT, 0x20))
                                {
                                    If (LEqual (And (PRIT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x02))
                                {
                                    Store (Or (SDT1, 0x40), DMD1)
                                    If (And (ICR1, 0x02))
                                    {
                                        If (And (ICR0, 0x02))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x02))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (PIB1)
                            }
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            Name (SBUF, Buffer (0x14)
                            {
                                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                                /* 0010 */    0x00, 0x00, 0x00, 0x00
                            })
                            CreateDWordField (SBUF, Zero, PIO0)
                            CreateDWordField (SBUF, 0x04, DMA0)
                            CreateDWordField (SBUF, 0x08, PIO1)
                            CreateDWordField (SBUF, 0x0C, DMA1)
                            CreateDWordField (SBUF, 0x10, FLAG)
                            Store (GETP (SECT), PIO0)
                            Store (GDMA (And (SYNC, 0x04), And (ICR3, 0x04), 
                                And (ICR0, 0x04), SDT2, And (ICR1, 0x04)), DMA0)
                            If (LEqual (DMA0, Ones))
                            {
                                Store (PIO0, DMA0)
                            }

                            If (And (SECT, 0x4000))
                            {
                                If (LEqual (And (SECT, 0x90), 0x80))
                                {
                                    Store (0x0384, PIO1)
                                }
                                Else
                                {
                                    Store (GETT (SSIT), PIO1)
                                }
                            }
                            Else
                            {
                                Store (Ones, PIO1)
                            }

                            Store (GDMA (And (SYNC, 0x08), And (ICR3, 0x08), 
                                And (ICR0, 0x08), SDT3, And (ICR1, 0x08)), DMA1)
                            If (LEqual (DMA1, Ones))
                            {
                                Store (PIO1, DMA1)
                            }

                            Store (GETF (And (SYNC, 0x04), And (SYNC, 0x08), 
                                SECT), FLAG)
                            Return (SBUF)
                        }
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        If (LEqual (SCFG, Zero))
                        {
                            CreateDWordField (Arg0, Zero, PIO0)
                            CreateDWordField (Arg0, 0x04, DMA0)
                            CreateDWordField (Arg0, 0x08, PIO1)
                            CreateDWordField (Arg0, 0x0C, DMA1)
                            CreateDWordField (Arg0, 0x10, FLAG)
                            If (LEqual (SizeOf (Arg1), 0x0200))
                            {
                                And (SECT, 0x40F0, SECT)
                                And (SYNC, 0x0B, SYNC)
                                Store (Zero, SDT2)
                                And (ICR0, 0x0B, ICR0)
                                And (ICR1, 0x0B, ICR1)
                                And (ICR3, 0x0B, ICR3)
                                And (ICR5, 0x0B, ICR5)
                                CreateWordField (Arg1, 0x62, W490)
                                CreateWordField (Arg1, 0x6A, W530)
                                CreateWordField (Arg1, 0x7E, W630)
                                CreateWordField (Arg1, 0x80, W640)
                                CreateWordField (Arg1, 0xB0, W880)
                                CreateWordField (Arg1, 0xBA, W930)
                                Or (SECT, 0x8004, SECT)
                                If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                                {
                                    Or (SECT, 0x02, SECT)
                                }

                                Or (SECT, SETP (PIO0, W530, W640), SECT)
                                If (And (FLAG, One))
                                {
                                    Or (SYNC, 0x04, SYNC)
                                    Store (SDMA (DMA0), SDT2)
                                    If (LLess (DMA0, 0x1E))
                                    {
                                        Or (ICR3, 0x04, ICR3)
                                    }

                                    If (LLess (DMA0, 0x3C))
                                    {
                                        Or (ICR0, 0x04, ICR0)
                                    }

                                    Or (ICR1, 0x04, ICR1)
                                }
                            }

                            If (LEqual (SizeOf (Arg2), 0x0200))
                            {
                                And (SECT, 0x3F0F, SECT)
                                Store (Zero, SSIT)
                                And (SYNC, 0x07, SYNC)
                                Store (Zero, SDT3)
                                And (ICR0, 0x07, ICR0)
                                And (ICR1, 0x07, ICR1)
                                And (ICR3, 0x07, ICR3)
                                And (ICR5, 0x07, ICR5)
                                CreateWordField (Arg2, 0x62, W491)
                                CreateWordField (Arg2, 0x6A, W531)
                                CreateWordField (Arg2, 0x7E, W631)
                                CreateWordField (Arg2, 0x80, W641)
                                CreateWordField (Arg2, 0xB0, W881)
                                CreateWordField (Arg2, 0xBA, W931)
                                Or (SECT, 0x8040, SECT)
                                If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                                {
                                    Or (SECT, 0x20, SECT)
                                }

                                If (And (FLAG, 0x10))
                                {
                                    Or (SECT, 0x4000, SECT)
                                    If (LGreater (PIO1, 0xF0))
                                    {
                                        Or (SECT, 0x80, SECT)
                                    }
                                    Else
                                    {
                                        Or (SECT, 0x10, SECT)
                                        Store (SETT (PIO1, W531, W641), SSIT)
                                    }
                                }

                                If (And (FLAG, 0x04))
                                {
                                    Or (SYNC, 0x08, SYNC)
                                    Store (SDMA (DMA1), SDT3)
                                    If (LLess (DMA1, 0x1E))
                                    {
                                        Or (ICR3, 0x08, ICR3)
                                    }

                                    If (LLess (DMA1, 0x3C))
                                    {
                                        Or (ICR0, 0x08, ICR0)
                                    }

                                    Or (ICR1, 0x08, ICR1)
                                }
                            }
                        }
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB0, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                })
                                CreateByteField (SIB0, One, PMD0)
                                CreateByteField (SIB0, 0x08, DMD0)
                                If (And (SECT, 0x02))
                                {
                                    If (LEqual (And (SECT, 0x09), 0x08))
                                    {
                                        Store (0x08, PMD0)
                                    }
                                    Else
                                    {
                                        Store (0x0A, PMD0)
                                        ShiftRight (And (SECT, 0x0300), 0x08, Local0)
                                        ShiftRight (And (SECT, 0x3000), 0x0C, Local1)
                                        Add (Local0, Local1, Local2)
                                        If (LEqual (0x03, Local2))
                                        {
                                            Store (0x0B, PMD0)
                                        }

                                        If (LEqual (0x05, Local2))
                                        {
                                            Store (0x0C, PMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD0)
                                }

                                If (And (SYNC, 0x04))
                                {
                                    Store (Or (SDT2, 0x40), DMD0)
                                    If (And (ICR1, 0x04))
                                    {
                                        If (And (ICR0, 0x04))
                                        {
                                            Add (DMD0, 0x02, DMD0)
                                        }

                                        If (And (ICR3, 0x04))
                                        {
                                            Store (0x45, DMD0)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                                }

                                Return (SIB0)
                            }
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (SCFG, Zero))
                            {
                                Name (SIB1, Buffer (0x0E)
                                {
                                    /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                })
                                CreateByteField (SIB1, One, PMD1)
                                CreateByteField (SIB1, 0x08, DMD1)
                                If (And (SECT, 0x20))
                                {
                                    If (LEqual (And (SECT, 0x90), 0x80))
                                    {
                                        Store (0x08, PMD1)
                                    }
                                    Else
                                    {
                                        Add (And (SSIT, 0x03), ShiftRight (And (SSIT, 0x0C), 
                                            0x02), Local0)
                                        If (LEqual (0x05, Local0))
                                        {
                                            Store (0x0C, PMD1)
                                        }
                                        Else
                                        {
                                            If (LEqual (0x03, Local0))
                                            {
                                                Store (0x0B, PMD1)
                                            }
                                            Else
                                            {
                                                Store (0x0A, PMD1)
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (One, PMD1)
                                }

                                If (And (SYNC, 0x08))
                                {
                                    Store (Or (SDT3, 0x40), DMD1)
                                    If (And (ICR1, 0x08))
                                    {
                                        If (And (ICR0, 0x08))
                                        {
                                            Add (DMD1, 0x02, DMD1)
                                        }

                                        If (And (ICR3, 0x08))
                                        {
                                            Store (0x45, DMD1)
                                        }
                                    }
                                }
                                Else
                                {
                                    Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                                }

                                Return (SIB1)
                            }
                        }
                    }
                }
            }
        }
    }
}

