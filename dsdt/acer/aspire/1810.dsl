/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20090422
 *
 * Disassembly of 1810, Sun Jan 10 21:16:29 2010
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000073EA (29674)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0xCF
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "1025"
 *     Compiler Version 0x01000013 (16777235)
 */
DefinitionBlock ("1810.aml", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000001)
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
    Name (PEHS, 0xF4)
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
        THTL,   5, 
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

    OperationRegion (MBOX, SystemMemory, 0xBBBBE918, 0x000002BC)
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
        NBTV,   64, 
        BTOD,   64, 
        SPVP,   16, 
        POPW,   16, 
        USPW,   16, 
        HDPW,   16, 
        SAHP,   16, 
        SAHF,   8, 
        SUVF,   8, 
        USRF,   8, 
        UMPW,   8, 
        SMHP,   16, 
        SAMP,   16, 
        SAMF,   8, 
        SPFA,   8, 
        SPFB,   8, 
        SPFC,   8, 
        SPFD,   8, 
        SPFE,   8, 
        SPFF,   8, 
        SPFG,   8, 
        SPFH,   8, 
        SPFI,   8, 
        SPFJ,   8, 
        SPFK,   8, 
        SPFL,   8, 
        SPFM,   8, 
        SPFN,   8, 
        SPFO,   8, 
        SPFP,   8, 
        SPFQ,   8, 
        SPFR,   8, 
        SPFS,   8, 
        SPFT,   8, 
        SPFU,   8, 
        SPFV,   8, 
        SPFW,   8, 
        SPFX,   8, 
        SPFY,   8, 
        SPFZ,   8, 
        SPF0,   8, 
        SPF1,   8, 
        SPF2,   8, 
        SPF3,   8, 
        SPF4,   8, 
        SPF5,   8, 
        KRSV,   136, 
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
        SMFQ,   8, 
        UPFF,   8, 
        UPFT,   8, 
        GRTT,   8, 
        CRID,   8, 
        CRSV,   480, 
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

    OperationRegion (NVST, SystemMemory, 0xBBBBEBD4, 0x00000122)
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
        DI00,   320, 
        BI00,   32, 
        BI01,   32, 
        BI02,   32, 
        BI03,   32, 
        BI04,   32, 
        BI05,   32, 
        BI06,   32, 
        BI07,   32, 
        BI08,   32, 
        BI09,   32, 
        BI10,   32, 
        BI11,   32, 
        BI12,   32, 
        BI13,   32, 
        BI14,   32, 
        BI15,   32, 
        BI16,   32, 
        BI17,   16
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
        SSMP,   8
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

    Name (PSTA, Zero)
    Method (_PTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            CMSW (0x3F, 0x3F)
            Store (0x54, P80H)
            If (ECON)
            {
                Store (One, \_SB.PCI0.LPC.EC0.FLS4)
            }
        }

        Return (Zero)
    }

    Method (_WAK, 1, NotSerialized)
    {
        If (ECON)
        {
            \_SB.BAT1.UBIF ()
            Notify (\_SB.BAT1, 0x80)
            Notify (\_SB.BAT1, 0x81)
        }

        If (LEqual (RP1D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP1.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP1, Zero)
                Store (One, PRM0)
                Store (PEHS, SSMP)
            }
        }

        If (LEqual (RP2D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP2.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP2, Zero)
                Store (0x02, PRM0)
                Store (PEHS, SSMP)
            }
        }

        If (LEqual (RP3D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP3.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP3, Zero)
                Store (0x03, PRM0)
                Store (PEHS, SSMP)
            }
        }

        If (LEqual (RP4D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP4.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP4, Zero)
                Store (0x04, PRM0)
                Store (PEHS, SSMP)
            }
        }

        If (LEqual (RP5D, Zero))
        {
            If (LEqual (\_SB.PCI0.EXP5.PDSX, One))
            {
                Notify (\_SB.PCI0.EXP5, Zero)
                Store (0x05, PRM0)
                Store (PEHS, SSMP)
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            If (LEqual (\_SB.PCI0.LPC.RTCW, Zero))
            {
                Notify (\_SB.PWRB, 0x02)
            }

            If (LAnd (DTSE, CMPE))
            {
                Store (0x14, DTSF)
                Store (Zero, TRPD)
            }

            Store (0xE3, P80H)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LAnd (DTSE, CMPE))
            {
                Store (0x14, DTSF)
                Store (Zero, TRPD)
            }

            Notify (\_SB.PWRB, 0x02)
            Store (0xE4, P80H)
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
                        Notify (\_SB.PCI0.EXP1, Zero)
                        Store (One, PRM0)
                        Store (PEHS, SSMP)
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
                        Store (0x02, PRM0)
                        Store (PEHS, SSMP)
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
                        Store (0x03, PRM0)
                        Store (PEHS, SSMP)
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
                        Store (0x04, PRM0)
                        Store (PEHS, SSMP)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP4.HPSX)
                    }
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP5.VDID, 0xFFFF))
            {
                If (LAnd (LEqual (RP5D, Zero), \_SB.PCI0.EXP5.HPSX))
                {
                    Sleep (0x64)
                    If (\_SB.PCI0.EXP5.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP5.PDCX)
                        Store (One, \_SB.PCI0.EXP5.HPSX)
                        Notify (\_SB.PCI0.EXP5, Zero)
                        Store (0x05, PRM0)
                        Store (PEHS, SSMP)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP5.HPSX)
                    }
                }
            }

            If (LNotEqual (\_SB.PCI0.EXP6.VDID, 0xFFFF))
            {
                If (LAnd (LEqual (RP6D, Zero), \_SB.PCI0.EXP6.HPSX))
                {
                    Sleep (0x64)
                    If (\_SB.PCI0.EXP6.PDCX)
                    {
                        Store (One, \_SB.PCI0.EXP6.PDCX)
                        Store (One, \_SB.PCI0.EXP6.HPSX)
                        Notify (\_SB.PCI0.EXP6, Zero)
                        Store (0x06, PRM0)
                        Store (PEHS, SSMP)
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.EXP6.HPSX)
                    }
                }
            }
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

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EXP1, 0x02)
            Notify (\_SB.PCI0.EXP1.PXSX, 0x02)
            Notify (\_SB.PCI0.EXP2, 0x02)
            Notify (\_SB.PCI0.EXP3, 0x02)
            Notify (\_SB.PCI0.EXP4, 0x02)
            Notify (\_SB.PCI0.EXP5, 0x02)
            Notify (\_SB.PCI0.EXP6, 0x02)
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

        Method (_L16, 0, NotSerialized)
        {
            Not (\_SB.PCI0.LPC.IV06, \_SB.PCI0.LPC.IV06)
            Store (0x16, P80H)
            Notify (\_SB.LID0, 0x80)
        }
    }

    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (LEqual (^^PCI0.LPC.GP06, One))
                {
                    Store (One, LIDS)
                    ^^PCI0.OVGA.GLID (One)
                }
                Else
                {
                    Store (Zero, LIDS)
                    ^^PCI0.OVGA.GLID (Zero)
                }

                Return (LIDS)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (BAT1)
        {
            Name (CBTI, Zero)
            Name (PBTI, Zero)
            Name (BTIN, Zero)
            Name (BTCH, Zero)
            Name (BIFI, Zero)
            Name (SEL0, Zero)
            Name (BCRI, Zero)
            Name (PBIF, Package (0x0D)
            {
                One, 
                0x1130, 
                0x1130, 
                One, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                Zero, 
                Ones, 
                Ones, 
                0x2710
            })
            Name (ERRC, Zero)
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, Zero)
            Method (_STA, 0, NotSerialized)
            {
                If (BTIN)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Name (BTPV, Ones)
            Method (_BTP, 1, NotSerialized)
            {
                Store (Arg0, BTPV)
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (LEqual (BIFI, Zero))
                {
                    UBIF ()
                    Store (One, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (^^PCI0.LPC.EC0.BTDC, Local0)
                    Store (^^PCI0.LPC.EC0.LFC2, Local1)
                    Store (^^PCI0.LPC.EC0.BTDV, Local2)
                    Store (^^PCI0.LPC.EC0.BTMD, Local3)
                    Store (^^PCI0.LPC.EC0.BTMN, Local4)
                    Store (^^PCI0.LPC.EC0.BTSN, Local5)
                    Store (^^PCI0.LPC.EC0.LION, Local6)
                    Store (Local0, Index (PBIF, One))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Store (Zero, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x1F, Local3)
                    If (LEqual (Local3, One))
                    {
                        Store ("UM09E71", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("UM09E75", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("UM09E70", Index (PBIF, 0x09))
                            }
                            Else
                            {
                                If (LEqual (Local3, 0x04))
                                {
                                    Store ("UM09E78", Index (PBIF, 0x09))
                                }
                                Else
                                {
                                    If (LEqual (Local3, 0x05))
                                    {
                                        Store ("UM09E36", Index (PBIF, 0x09))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local3, 0x06))
                                        {
                                            Store ("UM09E51", Index (PBIF, 0x09))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local3, 0x07))
                                            {
                                                Store ("UM09E31", Index (PBIF, 0x09))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local3, 0x08))
                                                {
                                                    Store ("UM09B7C", Index (PBIF, 0x09))
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local3, 0x09))
                                                    {
                                                        Store ("UM09A31", Index (PBIF, 0x09))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Local3, 0x0A))
                                                        {
                                                            Store ("UM09A71", Index (PBIF, 0x09))
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (Local3, 0x0B))
                                                            {
                                                                Store ("UM09A41", Index (PBIF, 0x09))
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (Local3, 0x0C))
                                                                {
                                                                    Store ("UM09E56", Index (PBIF, 0x09))
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (Local3, 0x0D))
                                                                    {
                                                                        Store ("UM09E7B", Index (PBIF, 0x09))
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (Local3, 0x0E))
                                                                        {
                                                                            Store ("UM09E72", Index (PBIF, 0x09))
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (Local3, 0x0F))
                                                                            {
                                                                                Store ("UM09E32", Index (PBIF, 0x09))
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (Local3, 0x10))
                                                                                {
                                                                                    Store ("UM09E52", Index (PBIF, 0x09))
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Local4, 0x03))
                    {
                        Store ("SANYO", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x04))
                        {
                            Store ("SONY", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store ("PANASONIC", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x07))
                                {
                                    Store ("SIMPLO", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x08))
                                    {
                                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local4, 0x09))
                                        {
                                            Store ("Celxpert", Index (PBIF, 0x0C))
                                        }
                                        Else
                                        {
                                            Store ("UNKNOWN", Index (PBIF, 0x0C))
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Store (ITOS (Local5), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, Zero)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, Zero))
                {
                    Store (Zero, Index (PBST, Zero))
                    Store (Ones, Index (PBST, One))
                    Store (Ones, Index (PBST, 0x02))
                    Store (Ones, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (ECON)
                {
                    Store (^^PCI0.LPC.EC0.MBTC, Local0)
                    Store (^^PCI0.LPC.EC0.MBRM, Local1)
                    Store (^^PCI0.LPC.EC0.MBVG, Local2)
                    Store (^^PCI0.LPC.EC0.MCUR, Local3)
                    Store (^^PCI0.LPC.EC0.BTST, Local4)
                    Store (^^PCI0.LPC.EC0.MBTF, Local5)
                    Store (^^PCI0.LPC.EC0.ACDF, Local6)
                    If (Local6)
                    {
                        If (LEqual (Local5, One))
                        {
                            Store (Zero, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local0, One))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (Zero, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, One))
                        {
                            Store (One, Local7)
                        }
                        Else
                        {
                            Store (Zero, Local7)
                        }
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, Zero))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local2, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, One))
                }

                Return (PBST)
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
            Method (BATS, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (^^PCI0.LPC.EC0.MBTS, Local0)
                    If (LEqual (Local0, One))
                    {
                        If (LEqual (BTIN, Zero))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (One, BTIN)
                    }
                    Else
                    {
                        If (LEqual (BTIN, One))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (Zero, BTIN)
                    }
                }
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (ACST, Zero)
            Method (_PSR, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (^^PCI0.LPC.EC0.ACDF, ACST)
                }
                Else
                {
                    Store (One, ACST)
                }

                If (ACST)
                {
                    Store (One, Local0)
                    Store (Zero, ^^BAT1.BCRI)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Return (Local0)
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
                    }

                    If (_OSI ("Windows 2009"))
                    {
                        Store (0x07D9, OSYS)
                    }
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

            Device (OVGA)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x07), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Store (Zero, NDID)
                    If (LNotEqual (DIDL, Zero))
                    {
                        Store (SDDL (DID1), DID1)
                    }

                    If (LNotEqual (DDL2, Zero))
                    {
                        Store (SDDL (DID2), DID2)
                    }

                    If (LNotEqual (DDL3, Zero))
                    {
                        Store (SDDL (DID3), DID3)
                    }

                    If (LNotEqual (DDL4, Zero))
                    {
                        Store (SDDL (DID4), DID4)
                    }

                    If (LNotEqual (DDL5, Zero))
                    {
                        Store (SDDL (DID5), DID5)
                    }

                    If (LEqual (NDID, One))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP1, Zero))
                        Return (TMP1)
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP2, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP2, One))
                        Return (TMP2)
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP3, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP3, One))
                        Store (Or (0x00010000, DID3), Index (TMP3, 0x02))
                        Return (TMP3)
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP4, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP4, One))
                        Store (Or (0x00010000, DID3), Index (TMP4, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP4, 0x03))
                        Return (TMP4)
                    }

                    If (LGreater (NDID, 0x04))
                    {
                        Name (TMP5, Package (0x05)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x00010000, DID1), Index (TMP5, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP5, One))
                        Store (Or (0x00010000, DID3), Index (TMP5, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP5, 0x03))
                        Store (Or (0x00010000, DID5), Index (TMP5, 0x04))
                        Return (TMP5)
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
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

                    Method (_BCL, 0, NotSerialized)
                    {
                        Return (Package (0x0C)
                        {
                            0x64, 
                            0x1E, 
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
                        If (LAnd (LGreaterEqual (Arg0, 0x0A), LLessEqual (Arg0, 0x64)))
                        {
                            Store (Arg0, BRTL)
                            AINT (One, Arg0)
                        }
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        Return (BRTL)
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

            Device (LPC)
            {
                OperationRegion (PMIO, SystemIO, 0x0400, 0x10)
                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                        ,   9, 
                    RTCW,   1
                }

                OperationRegion (GPIO, SystemIO, 0x0500, 0x40)
                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x0C), 
                    GP00,   1, 
                    GP01,   1, 
                    GP02,   1, 
                    GP03,   1, 
                    GP04,   1, 
                    GP05,   1, 
                    GP06,   1, 
                    GP07,   1, 
                    GP08,   1, 
                    GP09,   1, 
                    GP10,   1, 
                    GP11,   1, 
                    GP12,   1, 
                    GP13,   1, 
                    GP14,   1, 
                    GP15,   1, 
                    GP16,   1, 
                    GP17,   1, 
                    GP18,   1, 
                    GP19,   1, 
                    GP20,   1, 
                    GP21,   1, 
                    GP22,   1, 
                    GP23,   1, 
                    GP24,   1, 
                    GP25,   1, 
                    GP26,   1, 
                    GP27,   1, 
                    GP28,   1, 
                    GP29,   1, 
                    GP30,   1, 
                    GP31,   1, 
                            Offset (0x2C), 
                        ,   6, 
                    IV06,   1, 
                            Offset (0x38), 
                    GP32,   1, 
                    GP33,   1, 
                    GP34,   1, 
                    GP35,   1, 
                    GP36,   1, 
                    GP37,   1, 
                    GP38,   1, 
                    GP39,   1, 
                    GP40,   1, 
                    GP41,   1, 
                    GP42,   1, 
                    GP43,   1, 
                    GP44,   1, 
                    GP45,   1, 
                    GP46,   1, 
                    GP47,   1, 
                    GP48,   1, 
                    GP49,   1, 
                    GP50,   1, 
                    GP51,   1, 
                    GP52,   1, 
                    GP53,   1, 
                    GP54,   1, 
                    GP55,   1, 
                    GP56,   1, 
                    GP57,   1, 
                    GP58,   1, 
                    GP59,   1, 
                    GP60,   1, 
                    GP61,   1, 
                    GP62,   1, 
                    GP63,   1
                }

                Name (_ADR, 0x001F0000)
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
                    Name (_HID, EisaId ("SYN1B20"))
                    Name (_CID, Package (0x01)
                    {
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_GPE, 0x18)
                    Name (SEL0, 0xF0)
                    Name (BFLG, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (One, ECON)
                            }
                            Else
                            {
                                Store (Zero, ECON)
                            }
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                        BATD,   16, 
                        ACDF,   1, 
                                Offset (0x41), 
                            ,   5, 
                        FLS4,   1, 
                                Offset (0x42), 
                                Offset (0x4C), 
                        ARCD,   1, 
                            ,   3, 
                        DOCK,   1, 
                        LANC,   1, 
                        LID2,   1, 
                        CRTS,   1, 
                                Offset (0x51), 
                        BLVL,   8, 
                                Offset (0x53), 
                        DOFF,   8, 
                                Offset (0x58), 
                        CTMP,   8, 
                        RG59,   8, 
                                Offset (0x60), 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                        WLA2,   1, 
                            ,   2, 
                        WLST,   1, 
                        BLTS,   1, 
                            ,   2, 
                        ST3G,   1, 
                        MNST,   1, 
                            ,   1, 
                        ED3G,   1, 
                            ,   1, 
                        TPST,   1, 
                                Offset (0x63), 
                        TJ85,   1, 
                            ,   6, 
                        VGAF,   1, 
                                Offset (0x70), 
                        BTMD,   8, 
                        MBTS,   1, 
                        MBTF,   1, 
                        BATF,   1, 
                            ,   3, 
                        MBDX,   1, 
                        MBAD,   1, 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                        MCYC,   16, 
                        MTMP,   16, 
                        MDAT,   16, 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        MRTF,   16, 
                        MMER,   8, 
                        BA2C,   8, 
                        LFC2,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                                Offset (0x93), 
                        BTST,   8, 
                                Offset (0x9D), 
                        OSTP,   1, 
                                Offset (0xA0), 
                        ABMD,   8, 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   4, 
                        ABDX,   1, 
                        ABAD,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0xA8), 
                        ACYC,   16, 
                        ATMP,   16, 
                        ADAT,   16, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
                        ARTF,   16, 
                        AMER,   8, 
                                Offset (0xB8), 
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD1), 
                        PWRE,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                                Offset (0xD6), 
                        DBPL,   8, 
                                Offset (0xE0), 
                        DESP,   8, 
                        DTS3,   8, 
                        DE0L,   8, 
                        DE0H,   8, 
                        DE1L,   8, 
                        DE1H,   8, 
                        DE2L,   8, 
                        DE2H,   8, 
                        DE3L,   8, 
                        DE3H,   8, 
                        DE4L,   8, 
                        DE4H,   8
                    }

                    Method (APOL, 1, NotSerialized)
                    {
                        Store (Arg0, DBPL)
                        Store (One, EBPL)
                    }

                    Method (CPOL, 1, NotSerialized)
                    {
                        If (LEqual (PSTA, Zero))
                        {
                            If (LNotEqual (ECON, Zero))
                            {
                                APOL (Arg0)
                                Store (One, PSTA)
                            }
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        Store (0x09, P80H)
                        If (ECON)
                        {
                            Store (Zero, PSTA)
                            ^^^^BAT1.BATS ()
                            Notify (ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (BAT1, 0x80)
                            If (^^^^BAT1.BTCH)
                            {
                                ^^^^BAT1.UBIF ()
                                Notify (BAT1, 0x81)
                                Store (Zero, ^^^^BAT1.BTCH)
                            }
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        Store (0x20, P80H)
                        If (ECON)
                        {
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (Zero, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (One)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, ^^^^BAT1.BCRI)
                                    Notify (BAT1, 0x80)
                                }
                                Else
                                {
                                    Store (Zero, ^^^^BAT1.BCRI)
                                }
                            }
                        }
                    }

                    Name (BUFF, Buffer (0x02)
                    {
                        0x00, 0x00
                    })
                    CreateByteField (BUFF, Zero, BF00)
                    CreateByteField (BUFF, One, BF01)
                    Method (_Q8E, 0, NotSerialized)
                    {
                        Store (0x8E, P80H)
                        If (LLessEqual (OSYS, 0x07D2))
                        {
                            ^^^OVGA.DD03._BQC ()
                            Store (BRTL, Local0)
                            If (LLess (Local0, 0x64))
                            {
                                Add (Local0, 0x0A, Local0)
                                ^^^OVGA.DD03._BCM (Local0)
                            }
                        }
                        Else
                        {
                            If (IGDS)
                            {
                                If (LLess (BRTL, 0x64))
                                {
                                    Notify (^^^OVGA.DD03, 0x86)
                                }
                            }
                        }
                    }

                    Method (_Q8F, 0, NotSerialized)
                    {
                        Store (0x8F, P80H)
                        If (LLessEqual (OSYS, 0x07D2))
                        {
                            ^^^OVGA.DD03._BQC ()
                            Store (BRTL, Local0)
                            If (LGreater (Local0, 0x0A))
                            {
                                Subtract (Local0, 0x0A, Local0)
                                ^^^OVGA.DD03._BCM (Local0)
                            }
                        }
                        Else
                        {
                            If (IGDS)
                            {
                                If (LGreater (BRTL, 0x0A))
                                {
                                    Notify (^^^OVGA.DD03, 0x87)
                                }
                            }
                        }
                    }

                    Method (_Q90, 0, NotSerialized)
                    {
                        Store (Zero, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q91, 0, NotSerialized)
                    {
                        Store (Zero, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q92, 0, NotSerialized)
                    {
                        Store (One, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q93, 0, NotSerialized)
                    {
                        Store (One, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q9D, 0, NotSerialized)
                    {
                        Store (0x02, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q9E, 0, NotSerialized)
                    {
                        Store (0x02, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_QA0, 0, NotSerialized)
                    {
                        Store (0x03, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }

                    Method (_QA1, 0, NotSerialized)
                    {
                        Store (0x03, ^^^WMID.BF00)
                        Notify (WMID, 0x80)
                    }
                }
            }

            Device (UHC0)
            {
                Name (_ADR, 0x001D0000)
                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Device (UHUB)
                {
                    Name (_ADR, Zero)
                    Device (POR1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                Device (UHUB)
                {
                    Name (_ADR, Zero)
                    Device (POR1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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

            Device (UHCR)
            {
                Name (_ADR, 0x001D0003)
                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
                Device (UHUB)
                {
                    Name (_ADR, Zero)
                    Device (POR1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Device (EHB1)
                {
                    Name (_ADR, Zero)
                    Device (POR3)
                    {
                        Name (_ADR, 0x03)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR4)
                    {
                        Name (_ADR, 0x04)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR5)
                    {
                        Name (_ADR, 0x05)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR6)
                    {
                        Name (_ADR, 0x06)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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

            Device (UHC3)
            {
                Name (_ADR, 0x001A0000)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Device (UHUB)
                {
                    Name (_ADR, Zero)
                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
                Device (UHUB)
                {
                    Name (_ADR, Zero)
                    Device (POR1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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

            Device (UHC5)
            {
                Name (_ADR, 0x001A0002)
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Device (UHUB)
                {
                    Name (_ADR, Zero)
                    Device (POR1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Device (EHB1)
                {
                    Name (_ADR, Zero)
                    Device (POR2)
                    {
                        Name (_ADR, 0x02)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR3)
                    {
                        Name (_ADR, 0x03)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR4)
                    {
                        Name (_ADR, 0x04)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR5)
                    {
                        Name (_ADR, 0x05)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }

                    Device (POR6)
                    {
                        Name (_ADR, 0x06)
                        Name (_UPC, Package (0x04)
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (Zero)
                        }
                    }
                }

                OperationRegion (USBR, PCI_Config, 0xC4, One)
                Field (USBR, AnyAcc, NoLock, Preserve)
                {
                    URES,   8
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, URES)
                    }
                    Else
                    {
                        Store (Zero, URES)
                    }
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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

            Device (EXP6)
            {
                Name (_ADR, 0x001C0005)
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
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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

            Method (GPIO, 4, NotSerialized)
            {
                If (LEqual (Or (Arg0, Arg1), Zero))
                {
                    Return (Ones)
                }
                Else
                {
                    If (And (LEqual (Arg0, Zero), LEqual (Arg1, One)))
                    {
                        Return (0x0384)
                    }
                }

                Return (Multiply (0x1E, Subtract (0x09, Add (Arg2, Arg3))
                    ))
            }

            Method (GDMA, 2, NotSerialized)
            {
                If (LEqual (Arg0, One))
                {
                    If (LEqual (Arg1, One))
                    {
                        Return (0x0F)
                    }
                }

                Return (Ones)
            }

            Method (SFLG, 5, NotSerialized)
            {
                Store (Zero, Local0)
                Or (Arg1, Local0, Local0)
                Or (ShiftLeft (Arg0, One), Local0, Local0)
                Or (ShiftLeft (Arg2, 0x03), Local0, Local0)
                Or (ShiftLeft (Arg3, 0x02), Local0, Local0)
                Or (ShiftLeft (Arg4, 0x04), Local0, Local0)
                Return (Local0)
            }

            Method (SPIO, 3, NotSerialized)
            {
                Name (PBUF, Buffer (0x05)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (PBUF, Zero, RCT)
                CreateByteField (PBUF, One, ISP)
                CreateByteField (PBUF, 0x02, FAST)
                CreateByteField (PBUF, 0x03, DMAE)
                CreateByteField (PBUF, 0x04, PIOT)
                If (LOr (LEqual (Arg0, Zero), LEqual (Arg0, Ones)))
                {
                    Return (PBUF)
                }

                If (LGreater (Arg0, 0xF0))
                {
                    Store (One, DMAE)
                    Store (Zero, PIOT)
                }
                Else
                {
                    Store (One, FAST)
                    If (And (Arg1, 0x02))
                    {
                        If (And (LEqual (Arg0, 0x78), And (Arg2, 0x02)))
                        {
                            Store (0x03, RCT)
                            Store (0x02, ISP)
                            Store (0x04, PIOT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0xB4), And (Arg2, One)
                            ))
                        {
                            Store (One, RCT)
                            Store (0x02, ISP)
                            Store (0x03, PIOT)
                            Return (PBUF)
                        }
                        Else
                        {
                            Store (Zero, RCT)
                            Store (One, ISP)
                            Store (0x02, PIOT)
                        }
                    }
                }

                Return (PBUF)
            }

            Method (SDMA, 3, NotSerialized)
            {
                Name (PBUF, Buffer (0x05)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (PBUF, Zero, PCT)
                CreateByteField (PBUF, One, PCB)
                CreateByteField (PBUF, 0x02, UDMT)
                CreateByteField (PBUF, 0x03, UDME)
                CreateByteField (PBUF, 0x04, DMAT)
                If (LOr (LEqual (Arg0, Zero), LEqual (Arg0, Ones)))
                {
                    Return (PBUF)
                }

                If (LLessEqual (Arg0, 0x78))
                {
                    If (And (Arg1, 0x04))
                    {
                        Store (One, UDME)
                        If (And (LLessEqual (Arg0, 0x0F), And (Arg2, 0x40)
                            ))
                        {
                            Store (One, UDMT)
                            Store (One, PCB)
                            Store (One, PCT)
                            Store (0x06, DMAT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0x14), And (Arg2, 0x20)
                            ))
                        {
                            Store (One, UDMT)
                            Store (One, PCB)
                            Store (One, PCT)
                            Store (0x05, DMAT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0x1E), And (Arg2, 0x10)
                            ))
                        {
                            Store (One, PCB)
                            Store (0x02, PCT)
                            Store (0x04, DMAT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0x2D), And (Arg2, 0x08)
                            ))
                        {
                            Store (One, PCB)
                            Store (One, PCT)
                            Store (0x03, DMAT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0x3C), And (Arg2, 0x04)
                            ))
                        {
                            Store (0x02, PCT)
                            Store (0x02, DMAT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0x5A), And (Arg2, 0x02)
                            ))
                        {
                            Store (One, PCT)
                            Store (One, DMAT)
                            Return (PBUF)
                        }

                        If (And (LLessEqual (Arg0, 0x78), And (Arg2, One)
                            ))
                        {
                            Store (Zero, DMAT)
                        }
                    }
                }

                Return (PBUF)
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
                CreateWordField (BUFF, Zero, BFW0)
                CreateWordField (BUFF, 0x02, BFW1)
                Name (BUF1, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                Name (AADS, Buffer (0x04)
                {
                    0x00
                })
                CreateField (AADS, Zero, 0x04, AS00)
                CreateField (AADS, 0x04, One, AS04)
                CreateField (AADS, 0x05, One, AS05)
                CreateField (AADS, 0x06, One, AS06)
                CreateField (AADS, 0x07, One, AS07)
                CreateField (AADS, 0x08, One, AS08)
                CreateField (AADS, 0x10, 0x10, AS0X)
                Name (BAEF, Zero)
                Name (BADF, Zero)
                Name (BADG, Package (0x0D)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    Zero, 
                    Zero, 
                    0x00010000
                })
                Name (WLDS, Zero)
                Name (WLED, Zero)
                Name (BTDS, Zero)
                Name (BTED, Zero)
                Name (BLDS, Zero)
                Name (BLED, Zero)
                Name (NTDC, Zero)
                Name (NTDV, Zero)
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
                Name (GSEE, 0x0501)
                Name (GSED, 0x0502)
                Name (VAPI, 0x0601)
                Name (VAPO, 0x0600)
                Name (WBBO, 0x0701)
                Name (WBBI, 0x0700)
                Name (G3MD, 0x0800)
                Name (G3ME, 0x0801)
                Name (LANI, 0x0900)
                Name (LANO, 0x0901)
                Name (LDOF, 0x0A00)
                Name (LDON, 0x0A01)
                Name (FNKE, 0x00010002)
                Name (FNF5, 0x00015001)
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
                Name (BEDS, Package (0x12)
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
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (WIT0, Zero)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
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
                Name (BOOT, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BOOT, Zero, 0x80, BO10)
                CreateField (BOOT, Zero, 0x40, BO11)
                CreateField (BOOT, Zero, 0x20, BO12)
                CreateField (BOOT, Zero, 0x10, BO13)
                CreateField (BOOT, Zero, 0x08, BO14)
                CreateField (BOOT, 0x80, 0x10, BO20)
                CreateField (BOOT, 0x90, 0x08, BO30)
                CreateField (BOOT, 0x98, 0x08, BO40)
                Name (SBRD, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                Name (PRDN, Buffer (0x46)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateField (PRDN, Zero, 0x20, PN01)
                CreateField (PRDN, 0x20, 0x20, PN02)
                CreateField (PRDN, 0x40, 0x20, PN03)
                CreateField (PRDN, 0x60, 0x20, PN04)
                CreateField (PRDN, 0x80, 0x20, PN05)
                CreateField (PRDN, 0xA0, 0x20, PN06)
                CreateField (PRDN, 0xC0, 0x20, PN07)
                CreateField (PRDN, 0xE0, 0x20, PN08)
                CreateField (PRDN, 0x0100, 0x20, PN09)
                CreateField (PRDN, 0x0120, 0x20, PN10)
                CreateField (PRDN, 0x0140, 0x20, PN11)
                CreateField (PRDN, 0x0160, 0x20, PN12)
                CreateField (PRDN, 0x0180, 0x20, PN13)
                CreateField (PRDN, 0x01A0, 0x20, PN14)
                CreateField (PRDN, 0x01C0, 0x20, PN15)
                CreateField (PRDN, 0x01E0, 0x20, PN16)
                CreateField (PRDN, 0x0200, 0x20, PN17)
                CreateField (PRDN, 0x0220, 0x10, PN18)
                Name (PANL, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                Method (AAF1, 0, NotSerialized)
                {
                    Store (IHWM (0x13, Zero), AADS)
                    If (ECON)
                    {
                        Store (^^LPC.EC0.BLTH, AS04)
                        Store (^^LPC.EC0.ST3G, AS06)
                    }
                }

                Method (WGDS, 1, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        If (ECON)
                        {
                            Store (^^LPC.EC0.WLST, Index (BADG, Zero))
                        }
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.BLTS, Index (BADG, One))
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03)) {}
                            Else
                            {
                                If (LEqual (_T_0, 0x08))
                                {
                                    Store (One, Index (BADG, 0x07))
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x09))
                                    {
                                        Store (Zero, Index (BADG, 0x08))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0A))
                                        {
                                            If (ECON)
                                            {
                                                Store (^^LPC.EC0.BLTS, Index (BADG, 0x0A))
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0C)) {}
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x0D))
                                                {
                                                    If (ECON)
                                                    {
                                                        Store (^^LPC.EC0.MNST, Index (BADG, 0x0C))
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (WSDS, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    Store (Arg0, Local0)
                    Store (BF00, Local1)
                    Store (Zero, Index (BADG, Subtract (Local0, One)))
                    If (ECON)
                    {
                        Name (_T_0, Zero)
                        Store (Local1, _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            Name (_T_1, Zero)
                            Store (Local0, _T_1)
                            If (LEqual (_T_1, 0x04))
                            {
                                Store (Zero, ^^LPC.EC0.WLST)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x05))
                                {
                                    Store (Zero, ^^LPC.EC0.BLTS)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x06)) {}
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x07))
                                        {
                                            Store (Zero, BAEF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x0B))
                                            {
                                                Store (Zero, ^^LPC.EC0.ED3G)
                                            }
                                            Else
                                            {
                                                Store (0x0100, Index (BADG, Subtract (Local0, One)))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Else
                        {
                            Name (_T_2, Zero)
                            Store (Local0, _T_2)
                            If (LEqual (_T_2, 0x04))
                            {
                                Store (One, ^^LPC.EC0.WLST)
                            }
                            Else
                            {
                                If (LEqual (_T_2, 0x05))
                                {
                                    Store (One, ^^LPC.EC0.BLTS)
                                }
                                Else
                                {
                                    If (LEqual (_T_2, 0x06)) {}
                                    Else
                                    {
                                        If (LEqual (_T_2, 0x07))
                                        {
                                            Store (One, BAEF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_2, 0x0B))
                                            {
                                                Store (One, ^^LPC.EC0.ED3G)
                                            }
                                            Else
                                            {
                                                Store (0x0100, Index (BADG, Subtract (Local0, One)))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (OEMN, 0, NotSerialized)
                {
                    If (LEqual (BGEF, One))
                    {
                        Store (NTDV, Local0)
                        If (LNotEqual (Local0, Zero))
                        {
                            Store (Zero, NTDV)
                            Return (Local0)
                        }
                    }

                    If (LEqual (BAEF, One))
                    {
                        Store (NTDC, Local0)
                        If (LNotEqual (Local0, Zero))
                        {
                            Store (Zero, NTDC)
                            Return (Local0)
                        }
                    }

                    If (LEqual (BFEF, One)) {}
                    If (ECON)
                    {
                        If (LEqual (BF00, Zero))
                        {
                            If (^^LPC.EC0.WLST)
                            {
                                Return (WLSE)
                            }
                            Else
                            {
                                Return (WLSD)
                            }
                        }

                        If (LEqual (BF00, One))
                        {
                            If (^^LPC.EC0.BLTS)
                            {
                                Return (BLTE)
                            }
                            Else
                            {
                                Return (BLTD)
                            }
                        }

                        If (LEqual (BF00, 0x02))
                        {
                            If (^^LPC.EC0.MNST)
                            {
                                Return (LDON)
                            }
                            Else
                            {
                                Return (LDOF)
                            }
                        }

                        If (LEqual (BF00, 0x03))
                        {
                            If (^^LPC.EC0.ED3G)
                            {
                                Return (G3ME)
                            }
                            Else
                            {
                                Return (G3MD)
                            }
                        }
                    }
                }

                Method (STRL, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    Store (Zero, BBSB)
                    Name (_T_0, Zero)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store (And (THTL, 0x0F), BBD0)
                        Store (Zero, BBD1)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Name (_T_1, Zero)
                            Store (Arg1, _T_1)
                            If (LEqual (_T_1, Zero))
                            {
                                Store (Zero, THTL)
                            }
                            Else
                            {
                                If (LEqual (_T_1, One))
                                {
                                    Store (0x11, THTL)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x02))
                                    {
                                        Store (0x12, THTL)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x03))
                                        {
                                            Store (0x13, THTL)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x04))
                                            {
                                                Store (0x14, THTL)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x05))
                                                {
                                                    Store (0x15, THTL)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_1, 0x06))
                                                    {
                                                        Store (0x16, THTL)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_1, 0x07))
                                                        {
                                                            Store (0x15, THTL)
                                                        }
                                                        Else
                                                        {
                                                            Store (Zero, THTL)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Store (Zero, BBSB)
                        }
                        Else
                        {
                            Store (0x00010000, BBSB)
                        }
                    }
                }

                Method (WODP, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x03)) {}
                    Else
                    {
                        Store (One, Index (BCDS, Subtract (Arg0, One)))
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        If (Arg1) {}
                        Else
                        {
                        }
                    }
                    Else
                    {
                    }
                }

                Method (GCPU, 1, NotSerialized)
                {
                    Store (DSY5, DSY0)
                    Store (Arg0, Local0)
                    Store (IHWM (Zero, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY00)
                    Store (DY61, DY01)
                    Store (DY62, DY02)
                    Store (DY63, DY03)
                }

                Method (MSRR, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (Arg0, DY00)
                    Store (IHWM (One, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (Zero, WIT0)
                    Store (WIT0, DY12)
                }

                Method (MSRW, 1, NotSerialized)
                {
                    Store (DSY3, DSY1)
                    Store (IHWM (0x02, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY60, DY10)
                    Store (DY61, DY11)
                    Store (Zero, WIT0)
                    Store (WIT0, DY12)
                }

                Method (C4C3, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    If (LEqual (Arg0, 0x04))
                    {
                        Store (BF00, Index (BCDS, 0x09))
                    }
                    Else
                    {
                    }
                }

                Method (CPUF, 0, NotSerialized)
                {
                }

                Method (CPUT, 0, NotSerialized)
                {
                }

                Method (PCIR, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (IHWM (0x03, Arg0), Local2)
                    Store (Local2, DY20)
                    Store (Local2, DSY6)
                    Store (DSY4, DSY2)
                    Store (DY60, DY20)
                }

                Method (PCIW, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg0, DY20)
                    Store (IHWM (0x04, Arg0), Local2)
                    Store (Local2, DSY6)
                    Store (DY61, BUFF)
                }

                Method (CPUS, 0, NotSerialized)
                {
                    Store (IHWM (0x05, Zero), Local2)
                    Store (Local2, BUFF)
                    Store (BUFF, Index (BCDS, 0x0C))
                }

                Method (PCID, 1, NotSerialized)
                {
                    Store (IHWM (0x06, Arg0), Local2)
                    Store (Local2, DSY6)
                }

                Method (BTIF, 2, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, BUFF)
                    If (LEqual (Local0, 0x0D))
                    {
                        Store (BF02, BF00)
                        Store (BF01, Local1)
                        Store (BF02, BF00)
                        Store (BF01, Local1)
                    }

                    If (LEqual (Local0, 0x0E))
                    {
                        If (LEqual (BF00, Zero))
                        {
                            Store (0xFF, BF00)
                        }
                        Else
                        {
                            Store (BF00, Local1)
                            Store (One, BF00)
                        }
                    }

                    If (LEqual (Local0, 0x13))
                    {
                        If (LEqual (BF00, 0x03))
                        {
                            Store (0x1111, BFW0)
                            Store (Zero, BFW1)
                        }

                        If (LEqual (BF00, 0x08))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.MTMP, BFW0)
                                Store (Zero, BFW1)
                            }
                        }

                        If (LEqual (BF00, 0x09))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.MBVG, BFW0)
                                Store (Zero, BFW1)
                            }
                        }

                        If (LEqual (BF00, 0x0A))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.MCUR, BFW0)
                                Store (Zero, BFW1)
                            }
                        }

                        If (LEqual (BF00, 0x0F))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.MBRM, BFW0)
                                Store (Zero, BFW1)
                            }
                        }

                        If (LEqual (BF00, 0x17))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.MCYC, BFW0)
                                Store (Zero, BF02)
                            }
                        }

                        If (LEqual (BF00, 0x18))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.BTDC, BFW0)
                                Store (Zero, BF02)
                            }
                        }

                        If (LEqual (BF00, 0x19))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.BTDV, BFW0)
                                Store (Zero, BF02)
                            }
                        }

                        If (LEqual (BF00, 0x1B))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.MDAT, BFW0)
                                Store (Zero, BF02)
                            }
                        }

                        If (LEqual (BF00, 0x1C))
                        {
                            If (ECON)
                            {
                                Store (^^LPC.EC0.BTSN, BFW0)
                                Store (Zero, BF02)
                            }
                        }
                    }
                }

                Method (CKGS, 0, NotSerialized)
                {
                    Store (One, GSTS)
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
                    Store (Arg0, Local0)
                    If (LEqual (Local0, One))
                    {
                        Store (One, BGEF)
                    }
                    Else
                    {
                        Store (Zero, BGEF)
                    }

                    Store (Zero, Index (BGDS, Zero))
                }

                Method (GSBD, 0, NotSerialized)
                {
                    IHWM (0x09, Zero)
                    Store (BI00, SBRD)
                }

                Method (GPN, 0, NotSerialized)
                {
                    IHWM (0x0A, Zero)
                    Store (BI00, PN01)
                    Store (BI01, PN02)
                    Store (BI02, PN03)
                    Store (BI03, PN04)
                    Store (BI04, PN05)
                    Store (BI05, PN06)
                    Store (BI06, PN07)
                    Store (BI07, PN08)
                    Store (BI08, PN09)
                    Store (BI09, PN10)
                    Store (BI10, PN11)
                    Store (BI11, PN12)
                    Store (BI12, PN13)
                    Store (BI13, PN14)
                    Store (BI14, PN15)
                    Store (BI15, PN16)
                    Store (BI16, PN17)
                    Store (BI17, PN18)
                }

                Name (_WDG, Buffer (0xB4)
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
                    /* 0088 */    0x42, 0x45, 0x01, 0x02, 0x45, 0xDD, 0x23, 0x59, 
                    /* 0090 */    0x80, 0x04, 0xD5, 0x4E, 0xB6, 0x1A, 0xC9, 0xEC, 
                    /* 0098 */    0x6C, 0x90, 0xE2, 0x6A, 0x42, 0x48, 0x01, 0x02, 
                    /* 00A0 */    0x97, 0x13, 0xAA, 0xFA, 0x88, 0x11, 0x8F, 0x44, 
                    /* 00A8 */    0x85, 0x16, 0x9A, 0x07, 0x98, 0x7D, 0xD3, 0x8A, 
                    /* 00B0 */    0x42, 0x49, 0x01, 0x02
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg1, _T_0)
                    If (LNotEqual (Match (Package (0x08)
                                    {
                                        One, 
                                        0x02, 
                                        0x03, 
                                        0x08, 
                                        0x09, 
                                        0x0A, 
                                        0x0C, 
                                        0x0D
                                    }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                    {
                        Store (Zero, Local0)
                    }
                    Else
                    {
                        If (LNotEqual (Match (Package (0x05)
                                        {
                                            0x04, 
                                            0x05, 
                                            0x06, 
                                            0x07, 
                                            0x0B
                                        }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                        {
                            If (LEqual (Arg1, 0x07))
                            {
                                Store (Arg2, BUFF)
                                If (BF00)
                                {
                                    Store (One, BAEF)
                                }
                            }

                            Store (One, Local0)
                        }
                    }

                    If (Local0)
                    {
                        WSDS (Arg1, Arg2)
                    }
                    Else
                    {
                        WGDS (Arg1)
                    }

                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LGreaterEqual (Arg0, 0x80))
                    {
                        If (LLess (Arg0, 0x83))
                        {
                            Return (OEMN ())
                        }
                    }
                }

                Method (WMBB, 3, NotSerialized)
                {
                    STRL (Arg1, Arg2)
                    If (LEqual (Arg1, One))
                    {
                        Store (BBSB, BUFF)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        Store (BBD1, BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBC, 3, NotSerialized)
                {
                    WODP (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, One, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, One))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
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
                        C4C3 (Arg1, Arg2)
                        ShiftRight (DerefOf (Index (BCDS, Add (Arg1, 0x05))), 0x10, 
                            BUFF)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x05))
                    {
                        C4C3 (Arg1, Arg2)
                        Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
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
                        PCID (Arg2)
                        Return (DSY6)
                    }
                }

                Method (WMBE, 3, NotSerialized)
                {
                    BTIF (Arg1, Arg2)
                    Store (BUFF, Debug)
                    Store (BEDS, Debug)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }

                Method (WMBF, 3, NotSerialized)
                {
                }

                Method (WMBG, 3, NotSerialized)
                {
                    Store (Arg2, BUFF)
                    WSVE (BF00)
                    Store (DerefOf (Index (BGDS, Subtract (Arg1, One))), BUFF)
                    Store (BUFF, Debug)
                    Return (BUFF)
                }

                Method (WMBH, 3, NotSerialized)
                {
                    If (LEqual (Arg1, One))
                    {
                        IHWM (0x10, Arg2)
                        Store (DI00, BUF1)
                        Return (BUF1)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        IHWM (0x11, Arg2)
                        Store (DI00, BUF1)
                        Return (BUF1)
                    }

                    If (LEqual (Arg1, 0x03))
                    {
                        IHWM (0x12, Arg2)
                        Store (DI00, BUF1)
                        Return (BUF1)
                    }

                    If (LEqual (Arg1, 0x04))
                    {
                        Store (Zero, BO10)
                        Store (BTOD, BO11)
                        Store (Zero, BO20)
                        Store (Zero, BO30)
                        Store (Zero, BO40)
                        Return (BOOT)
                    }

                    If (LEqual (Arg1, 0x05))
                    {
                        IHWM (0x08, Arg2)
                        Store (Arg2, BTOD)
                        Store (Zero, BO12)
                        Return (BO12)
                    }

                    If (LEqual (Arg1, 0x0A))
                    {
                        Store (Zero, BO12)
                        If (LEqual (D2DF, One))
                        {
                            Store (One, BO14)
                        }
                        Else
                        {
                            Store (Zero, BO14)
                        }

                        Return (BO12)
                    }
                }

                Method (WMBI, 3, NotSerialized)
                {
                    If (LEqual (Arg1, One))
                    {
                        GSBD ()
                        Return (SBRD)
                    }

                    If (LEqual (Arg1, 0x02))
                    {
                        GPN ()
                        Return (PRDN)
                    }

                    If (LEqual (Arg1, 0x03))
                    {
                        Store (IHWM (0x0B, Zero), BUF1)
                        Return (BUF1)
                    }

                    If (LEqual (Arg1, 0x06))
                    {
                        Return (0x04)
                    }

                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Zero, BO12)
                        Store (0x7D, CMSI)
                        ShiftRight (CMSD, 0x04, BO14)
                        Return (BO12)
                    }

                    If (LEqual (Arg1, 0x08))
                    {
                        Store (IHWM (0x0E, Zero), BUF1)
                        Return (BUF1)
                    }

                    If (LEqual (Arg1, 0x09))
                    {
                        Store (IHWM (0x0F, Zero), BUF1)
                        Return (BUF1)
                    }

                    If (LEqual (Arg1, 0x0A))
                    {
                        Store (Zero, BO12)
                        Store (0x7D, CMSI)
                        And (CMSD, 0x0F, BO14)
                        Return (BO12)
                    }

                    If (LEqual (Arg1, 0x0B))
                    {
                        Return (Zero)
                    }
                }
            }
        }
    }
}

