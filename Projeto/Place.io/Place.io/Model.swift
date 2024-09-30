//
//  Model.swift
//  TesteAppdia
//
//  Created by Turma02-28 on 04/09/24.
//

import Foundation
struct dia: Codable, Hashable{
    let dia1: String?
    let dia2: String?
    let dia3: String?
    let dia4: String?
    let dia5: String?
    let dia6: String?
    let dia7: String?
}

struct comenta: Codable, Hashable{
    var comentario: String?
    var nome: String?
    var umAval: Double?
    
}

struct Local: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nomeLocal: String?
    let horarioFuncionamento: [dia]?
    let endereco: String?
    let descricao: String?
    let latitude: String?
    let longitude: String?
    let telefone: String?
    let foto: String?
    let categoria: String?
    var save: Int?
    var coment: [comenta]?
    var nava: Int?
    
}

struct RatingModel {
    var rating: Int = 0
}
